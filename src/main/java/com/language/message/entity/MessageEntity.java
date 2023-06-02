package com.language.message.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.language.user.model.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class MessageEntity {
		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    @Column(nullable = false)
	    private String title;

	    @Column(nullable = false)
	    private String content;

	    @Column(nullable = false)
	    private boolean deletedBySender;

	    @Column(nullable = false)
	    private boolean deletedByReceiver;

	    @ManyToOne(fetch = FetchType.LAZY) // 사용자 한 명 기준으로 편지를 여러 개 쓸 수 있고, 여러 개 받을 수 있기 때문
	    @JoinColumn(name = "sender_id")
	    @OnDelete(action = OnDeleteAction.NO_ACTION)  //작성자 혹은 수신자가 계정을 삭제하면, 같이 지우기 위해
	    private User sender;

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "receiver_id")
	    @OnDelete(action = OnDeleteAction.NO_ACTION)
	    private User receiver;

	    public void deleteBySender() {
	        this.deletedBySender = true; //메소드를 호출했을 때 값이 true라면, 메시지를 DB에서 삭제
	    }

	    public void deleteByReceiver() {
	        this.deletedByReceiver = true;
	    }

	    public boolean isDeleted() {
	        return isDeletedBySender() && isDeletedByReceiver();
	    }
}
