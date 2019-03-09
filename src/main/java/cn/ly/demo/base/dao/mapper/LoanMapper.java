package cn.ly.demo.base.dao.mapper;

import cn.ly.demo.base.entity.Loan;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface LoanMapper {
    Loan getLoanById(Loan loan);

    List<Loan> getLoanListByUserId(Loan loan);

    List<Loan> getLoanList(HashMap<String, Integer> param);

    void updateLoanById(Loan loan);

    void addLoan(Loan loan);
}
