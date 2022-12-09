/* onclick 으로 부른 payment 함수 실행 */
function payment() {
	var sumhere = document.getElementById('sumhere');
	if (sumhere.textContent == "원") {
		Swal.fire({
			imageUrl: 'assets/manager/payq.png',
			imageWidth: 400,
			imageHeight: 300,
			title: '사장님 주문내역이 없어요!',
			showConfirmButton: false,
			timer: 1500
		})
	} else {
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
				var rform = document.getElementById('rform');
				rform.action = "/rpayment";
				rform.method = "post";
				rform.submit();
				
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

			} else if (result.isDenied) {
				Swal.fire({
					imageUrl: 'assets/manager/payq.png',
					imageWidth: 800,
					imageHeight: 500,
					imageAlt: '결제취소',
					title: '사장님 ?!',
					showConfirmButton: false,
					timer: 1500
				})
			}
		})
	}
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