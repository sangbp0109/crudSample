package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 0;
	private int totalRecord;
	
	private int totalPage;
	private int pagePerBlock = 5;
	private int recordPerPage = 10;
	private int beginPage;
	private int endPage;
	private String[] codeId;
	
	public void setPaging() {
		int totalPage = 0;
		totalPage = totalRecord / recordPerPage;
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		this.totalPage = (totalPage >= pageNo) ? totalPage : pageNo;
		
		int beginPage = ((pageNo - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = (beginPage + pagePerBlock - 1) < this.totalPage ? (beginPage + pagePerBlock - 1) : this.totalPage;
		this.beginPage = beginPage;
		this.endPage = endPage;
	
	}

	public int getPageNo() {
		return pageNo; 
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String[] getCodeId() {
		return codeId;
	}

	public void setCodeId(String[] codeId) {
		this.codeId = codeId;
	}

	
	
	
	
	
	
	
	
}
