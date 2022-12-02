/* onclick 으로 부른 payment 함수 실행 */
function payment() {
	/* 첫 alert 창 */
	Swal.fire({
		title: '결제 하시겠어요?',
		imageUrl: 'assets/manager/payq.png',
		imageWidth: 300,
		imageHeight: 200,
		imageAlt: '결제물어보기',
		showDenyButton: true,
		confirmButtonText: '결제',
		denyButtonText: `취소`,
	}).then((result) => {
		/* 호출버튼 */
		if (result.isConfirmed) {
			Swal.fire({
				imageUrl: 'assets/manager/pay1.png',
				imageWidth: 400,
				imageHeight: 300,
				imageAlt: '결제하기',
				title: '넵 결제중입니다!',
				showConfirmButton: false,
				timer: 1500
			})
			// 결제하면 기능 작동
			$.ajax({
				type: 'POST',
				url: '/rpayment',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify({
					"menu_name": name,
					"order_cnt": currentOrderCount.innerText
				}),
				success: () => console.log('data 삽입 완료'),
				error: () => {
					alert("에러")
				}
			});
			/* 취소버튼 */
		} else if (result.isDenied) {
			Swal.fire({
				imageUrl: 'assets/manager/payq.png',
				imageWidth: 1000,
				imageHeight: 600,
				imageAlt: '결제취소',
				title: '사장님 ?!',
				showConfirmButton: false,
				timer: 1500
			})
		}
	})
}
/* payment 함수 끝 */

/* onclick 으로 부른 stock_reset 함수 실행 */
function stock_reset() {
	/* 첫 alert 창 */
	Swal.fire({
		title: 'Reset ~!',
		showConfirmButton: false,
	})
}
/* stock_reset 함수 끝 */