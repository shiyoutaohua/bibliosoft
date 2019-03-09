package cn.ly.demo.base.dao;

import cn.ly.demo.base.dao.mapper.LoanMapper;
import cn.ly.demo.base.entity.Loan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class LoanDao {
    @Autowired
    private LoanMapper loanMapper;

    public Loan getLoanById(int loanId) {
        Loan loan = new Loan();
        loan.setId(loanId);
        return loanMapper.getLoanById(loan);
    }

    public List<Loan> getLoanList(int startIndex, int rowCount) {
        HashMap<String, Integer> parmaMap = new HashMap<>();
        parmaMap.put("startIndex", startIndex);
        parmaMap.put("rowCount", rowCount);
        return loanMapper.getLoanList(parmaMap);
    }

    public void updateLoanById(Loan loan) {
        loanMapper.updateLoanById(loan);
    }

    public List<Loan> getLoanListByUserId(Loan loan) {
        return loanMapper.getLoanListByUserId(loan);
    }

    public void addLoan(Loan loan) {
        loanMapper.addLoan(loan);
    }
}
