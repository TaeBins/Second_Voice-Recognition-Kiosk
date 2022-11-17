package com.KSCT.work.model;

import lombok.Data;

// @Getter : 모든 필드의 Getter 메소드 자동생성
// @Setter : 모든 필드의 Setter 메소드 자동생성
// @Data : Lombok에서 제공하는 필드관련 모든 코드 생성
// @ToString : 모든 필드의 toString 메소드 자동생성
// @NoArgsConstructor : 기본생성자를 자동으로 추가(접근 권한 protected로 제한)
// @AllArgsConstructor : 모든 필드값을 파라미터로 받는 생성자 추가
// @RequiredArgsConstructor : fianl(값이 할당되면 변경불가), @NonNull인 필드값만 파라미터로 받는 생성자 추가(주로 생성자 정의가 필요한 Controller, Service 클래스등의 상단에 사용)
// @Builder : 어느 필드에 어떤 값을 채워야 할지 명확하게 인지하여 생성
@Data
public class Menu {
	private String Type;
	private String Name;
	private int Price;
	private int Stock;
}
