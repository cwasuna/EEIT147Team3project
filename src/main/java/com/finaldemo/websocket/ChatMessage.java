package com.finaldemo.websocket;

/**
 * 傳輸的訊息
 */
public class ChatMessage {
    /** 訊息種類 */
    private ChatType type;
    /** 訊息發送者的名稱 */
    private String sender;
    /** 訊息發送者的圖片 */
    private String photo;
    /** 訊息內容 */
    private String content;

    /**
     * 訊息種類Enum
     */
    public enum ChatType {
        CHAT,
        JOIN,
        LEAVE
    }

	public ChatType getType() {
		return type;
	}

	public String getSender() {
		return sender;
	}

	public String getContent() {
		return content;
	}

	public void setType(ChatType type) {
		this.type = type;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
    
    // 省略getter setter 
    
}