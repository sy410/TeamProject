package com.ncs.one;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criTest.PageMaker;
import criTest.SearchCriteria;
import service.PmemberService;
import vo.PmemberVO;


@RestController
public class PmemberController {
	
	@Autowired
	PmemberService service;
	@Autowired 
	PasswordEncoder passwordEncoder;


	// ** ID 중복확인
	@RequestMapping(value = "/idCheck")
	public ModelAndView idCheck(ModelAndView mv, PmemberVO vo) {
		// => 전달된 ID의 존재여부 확인
		mv.addObject("newID", vo.getId());
		if (service.selectOne(vo) != null) {
		    mv.addObject("idUse", "F"); // 사용불가
		} else  mv.addObject("idUse", "T"); // 사용가능
		mv.setViewName("pmember/idDupCheck");
		return mv;
	} //idCheck 

	
	 // ID_form
	 @RequestMapping(value = "/findIdf") 
	 public ModelAndView findIdf (ModelAndView mv) { 
		 mv.setViewName("pmember/findIdForm"); 
		 return mv; 
	 } //findIdf
	  
	 // ** ID 찾기
	 @RequestMapping(value = "/findId")
	 public String pFindId(PmemberVO vo, Model model) {
	 
		PmemberVO pmember = service.pFindId(vo);
		if(pmember == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", pmember.getId());
		}			
		return "pmember/pmemberId";
	}
	 
	// Password_form
	@RequestMapping(value = "/findPwf") 
	public ModelAndView findPwf (ModelAndView mv) { 
		mv.setViewName("pmember/findPwForm"); 
		return mv; 
	 } //findIdf
	  
	// ** Password 찾기
	@RequestMapping(value = "/findPw")
	public String pFindPw (PmemberVO vo, Model model) {
		
		PmemberVO pwmember = service.pFindPw(vo);
		if(pwmember == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("pw", pwmember.getPw());
		}			
		return "pmember/pmemberPw";
	}
	
	
	
    // ** Member SearchCriteria PageList
	@RequestMapping(value="/pcplist")
	public ModelAndView pcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		// 1) Criteria 처리
		cri.setSnoEno();
		
		// 2) 서비스 처리
		mv.addObject("Banana",service.searchList(cri));	
		
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker =>"+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("pmember/pCriList");
		return mv;
	} //pCriList
	 
    
	// ** Joinf
	@RequestMapping(value ="/joinf")
	public ModelAndView joinf (ModelAndView mv) {
		mv.setViewName("pmember/joinForm");
		return mv;
	} //joinf
	
	// ** Join
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mv, PmemberVO vo, RedirectAttributes rttr){
		
		// ** Password 암호화
		// => BCryptPasswordEncoder 적용
		//    encode(rawData) -> digest 생성 & vo 에 set  
		vo.setPw(passwordEncoder.encode(vo.getPw()));
				
		if (service.insert(vo) > 0) {
			// 회원가입 성공
			rttr.addFlashAttribute("message", "회원가입 성공! 로그인 후 이용하세요.");
			mv.setViewName("pmember/loginForm");
		}else {
			// 회원가입 실패
			rttr.addFlashAttribute("message", "회원가입 실패! 다시 시도 하세요.");
			mv.setViewName("pmember/joinForm");
		}
		return mv;
	} // join
			
			
	// ** Loginf
	@RequestMapping(value = "/loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("pmember/loginForm");
		return mv;
	} //loginf
	
	// ** Login
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, PmemberVO vo) {
		
		String pw = vo.getPw();	
		vo = service.selectOne(vo);
		if(vo != null) {
				
			// ** BCryptPasswordEncoder 적용
			if (passwordEncoder.matches(pw, vo.getPw())) {
				// 로그인 성공
				request.getSession().setAttribute("loginID", vo.getId());
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW",pw);
				mv.setViewName("redirect:home");				
			 }else {
				// password 오류
				mv.addObject("message", "비밀번호를 잘못 입력하였습니다.");
				mv.setViewName("pmember/loginForm");
			}
		}else {
			// ID 오류
			mv.addObject("message","아이디를 잘못 입력하였습니다.");
			mv.setViewName("pmember/loginForm");
		}
		return mv;
	} //login
	
	
	// ** Logout
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) {
		// 존재하는 session 확인 후 삭제
		HttpSession session = request.getSession(false);
		if (session != null) {
				session.invalidate(); // session 삭제
		}
		rttr.addFlashAttribute("message", "로그아웃 되었습니다.");
		mv.setViewName("redirect:home");
		return mv;
	} // logout
	
	
	// ** List
	@RequestMapping(value = "/plist")
	public ModelAndView plist(ModelAndView mv) {
		
		List<PmemberVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana",list);
		} else {
			mv.addObject("message", "출력할 자료가 1건도 없습니다.");
		}
		mv.setViewName("pmember/pmemberList");
		return mv;
	} //plist
	
	@RequestMapping(value = "/pdetail")
	public ModelAndView pdetail(HttpServletRequest request, ModelAndView mv, PmemberVO vo) {
		
		HttpSession session = request.getSession(false);
		//String loginID = (String)session.getAttribute("loginID");
		
		//if (session!=null && loginID!=null) {
		//	vo.setId(loginID);
		
		if (session!=null && session.getAttribute("loginID") !=null) {
			vo.setId((String)session.getAttribute("loginID"));
			
			if  (request.getParameter("id")!=null) vo.setId(request.getParameter("id"));	
			
			vo=service.selectOne(vo);
			if (vo!=null) {
					if ("U".equals(request.getParameter("jcode"))) {
							mv.setViewName("pmember/pupdateForm");
					vo.setPw((String)session.getAttribute("loginPW"));
				}else {
					mv.setViewName("pmember/pmemberDetail");
					vo.setPw("*****");
				}
				mv.addObject("Apple", vo);
			}else {
				mv.addObject("message","회원 정보를 찾을 수 없습니다. 로그인 후 이용하세요.");
				mv.setViewName("pmember/loginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","로그인 정보 없습니다. 로그인 후 이용하세요.");
			mv.setViewName("pmember/loginForm");
		}
		return mv;
	} //pdetail
	
	
	// ** Update : 회원정보 수정
	@RequestMapping(value = "/pupdate")
	public ModelAndView pupdate(ModelAndView mv, PmemberVO vo, RedirectAttributes rttr) {
		// ** Password 암호화
		// => BCryptPasswordEncoder 적용
		vo.setPw(passwordEncoder.encode(vo.getPw()));
					
		if (service.update(vo) > 0) {
			// 수정 성공
			rttr.addFlashAttribute("message", "정보가 수정되었습니다.");
			mv.setViewName("redirect:pdetail?id="+vo.getId());
		} else {
			// 수정 실패
			rttr.addFlashAttribute("message", "정보 수정 오류! 다시 시도 하세요.");
			mv.setViewName("redirect:pdetail?id="+vo.getId()+"&jcode=U");
		}
		return mv;
	} //pupdate
	
	
	// ** Delete : 회원탈퇴
	@RequestMapping(value = "/pdelete")
	public ModelAndView pdelete(HttpServletRequest request, ModelAndView mv, PmemberVO vo, RedirectAttributes rttr) {
		
	// => 삭제 대상 -> vo에 set
	HttpSession session = request.getSession(false);
	String loginID = (String)session.getAttribute("loginID");
		
	if(session != null && loginID != null) {
		vo.setId(loginID);
		
		if(service.delete(vo) > 0) {
			// 삭제 성공 
			session.invalidate(); // session 삭제
			rttr.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
			mv.setViewName("redirect:home");
		}else {
			// 삭제 실패 
			rttr.addFlashAttribute("message", "회원탈퇴 실패! 다시 시도 하세요.");
			mv.setViewName("redirect:pdetail?id="+vo.getId());
		} 
	}else {
		mv.addObject("message", "로그인후 이용 하세요.");
		mv.setViewName("pmember/loginForm");
		}
		return mv;
	} //pdelete
	
} // class
