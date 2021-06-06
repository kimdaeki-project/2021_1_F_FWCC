package com.fw.s1.util;


public class ProductPager {
	private String collab;
	private String productType;
	
	private int perPage=40;
	private int perBlock=5;
	
	private long curPage;
	private long startRow;
	private long lastRow;
	private long startNum;
	private long lastNum;
	
	public String getSortStandard() {
		return sortStandard;
	}

	public void setSortStandard(String sortStandard) {
		this.sortStandard = sortStandard;
	}
	private long totalPage;
	
	private String sortStandard;
	
	
	
	
	
	
	//	============================================================== 코드 재확인 후 실행
	public void makeRow() {
		long startRow = (this.getCurPage()*perPage) - (perPage-1);
		long lastRow = (this.getCurPage()*perPage);
		
		this.setStartRow(startRow);
		this.setLastRow(lastRow);
	}
	
	public void makeNum(long totalCount) {
		long totalPage = totalCount/perPage;
		if(totalCount%perPage!=0) {
			totalPage++;
		}
		
		long totalBlock = totalPage/perBlock;
		if(totalPage%perBlock!=0) {
			totalBlock++;
		}
		
		long curBlock=this.getCurPage()/5;
		if(this.getCurPage()%5!=0) {
			curBlock++;
		}
		
		long startNum=(curBlock*perBlock)-(perBlock-1);
		long lastNum=curBlock*perBlock;
		
		if(curBlock == totalBlock) {
			lastNum=totalPage;
		}
		
		this.setTotalPage(totalPage);
		if(this.curPage>totalPage) {
			this.curPage=totalPage;
		}
		this.setStartNum(startNum);
		this.setLastNum(lastNum);
		
	}
// ============================================================ 코드 재확인 후 실행

	
	
	public String getCollab() {
		if(this.collab==null) {
			collab="";
		}
		return collab;
	}
	public void setCollab(String collab) {
		if(collab==null) {
			collab="";
		}
		this.collab = collab;
	}
	public String getProductType() {
		if(this.productType==null) {
			productType="";
		}
		return productType;
	}
	public void setProductType(String productType) {
		if(productType==null) {
			productType="";
		}
		this.productType = productType;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public long getCurPage() {
		if(this.curPage<1) {
			this.curPage=1;
		}
		return curPage;
	}
	public void setCurPage(long curPage) {
		if(curPage<1) {
			curPage=1;
		}
		
		this.curPage = curPage;
	}
	public long getStartRow() {
		return startRow;
	}
	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}
	public long getLastRow() {
		return lastRow;
	}
	public void setLastRow(long lastRow) {
		this.lastRow = lastRow;
	}
	public long getStartNum() {
		return startNum;
	}
	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}
	public long getLastNum() {
		return lastNum;
	}
	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
}
