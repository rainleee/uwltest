<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/fb8ae6e812.js"
	crossorigin="anonymous"></script>
<!-- 나눔고딕 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style>
div.challDate {
	text-align: right;
}


body {
	font-family: 'Nanum Gothic', sans-serif;
	font-family: 'Noto Sans KR', sans-serif; 
	background-color: #eeeeee;
}

/*  div.top{
       		background-color: gray;
        }
        
        #v-pills-tabContent{
        	background-color: blue;
        } */
/* 포인트들의 내용 */
/* .tab-pane {
        	border: 1px solid grey;
        } */

/* 아이콘 색 지정*/
.fa-coins {
	color: #ffc811;
}

.fa-running {
	color: #28aa10;
}

.fa-credit-card {
	color: #1e291b;
}

.fa-calendar-check {
	color: #a72644;
}

.fa-map-marked-alt {
	color: #168641;
}

.fa-piggy-bank {
	color: #ffb8c6;
}

.fa-camera {
	color: rgb(12, 98, 183);
}

.fa-clipboard {
	color: rgb(4, 4, 5);
}

.fa-medal {
	color: #ffc811;
}

/* 등록 하기위해 내가 추가한 것 */
div.addChallenge div.list {
	text-align: right;
	border-color: #c33214;
}

div.addChallenge div.list a {
	background-color: #EBAD7A;
	display: inline-block;
	line-height: 40px;
	padding: 0 65px;
	color: #fff;
	font-weight: bold;
	margin: 20px 0;
	border-color: #c33214;
	border: medium;
}

#challengeBox {
	border-color: #ebad7a;
}

div.alert {
	background-color: #f4cdad;
	border-color: #f4cdad;
}

img {
	display: none;
}

div.totalChallenge {
	font-size: 30px;
}


.file-upload {
  background-color: #ffffff;
  width: 600px;
  margin: 0 auto;
  padding: 20px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #15824B;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #1FB264;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #1FB264;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #15824B;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}
</style>

<script type="text/javascript">
	$(function() {

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".list-group-item").on(
				"click",
				function() {
					var challNo = $(this).children('div').children(
							"input[type='hidden']").val();
					console.log("challNo : " + challNo);
					self.location = "/challenge/getChallenge?challNo="
							+ challNo;
				});

		$(".list a:contains('등록')").on("click", function() {
			/* alert("등록되는거임 ㅋㅋ") */
			self.location = "/challenge/addChallenge"
		});

	});

	/* 페이지네비게이션 */
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		/* alert("currPage"+currentPage); */
		$("form").attr("method", "POST").attr("action",
				"/challenge/listAdminChallenge").submit();
	}
</script>
</head>
<body>
	<div>Teachable Machine Image Model</div>
	<button type="button" onclick="init()">시작</button>
	<script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<div class="file-upload">
		<button class="file-upload-btn" type="button"
			onclick="$('.file-upload-input').trigger( 'click' )">Add
			Image</button>

		<div class="image-upload-wrap">
			<input class="file-upload-input" type='file'
				onchange="readURL(this);" accept="image/*" />
			<div class="drag-text">
				<h3>Drag and drop a file or select add Image</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" src="#" alt="your image" />
			<div class="image-title-wrap">
				<button type="button" onclick="removeUpload()" class="remove-image">
					Remove <span class="image-title">Uploaded Image</span>
				</button>
			</div>
		</div>
	</div>
	<div id="webcam-container"></div>
	<div id="label-container"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<script type="text/javascript">
	function readURL(input) {
		  if (input.files && input.files[0]) {

		    var reader = new FileReader();

		    reader.onload = function(e) {
		      $('.image-upload-wrap').hide();

		      $('.file-upload-image').attr('src', e.target.result);
		      $('.file-upload-content').show();

		      $('.image-title').html(input.files[0].name);
		    };

		    reader.readAsDataURL(input.files[0]);

		  } else {
		    removeUpload();
		  }
		}

		function removeUpload() {
		  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
		  $('.file-upload-content').hide();
		  $('.image-upload-wrap').show();
		}
		$('.image-upload-wrap').bind('dragover', function () {
				$('.image-upload-wrap').addClass('image-dropping');
			});
			$('.image-upload-wrap').bind('dragleave', function () {
				$('.image-upload-wrap').removeClass('image-dropping');
		});
	
	</script>
	<script type="text/javascript">
		// More API functions here:
		// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

		// 내가만든 AI 딥러닝 시킨 주소
		const URL = "https://teachablemachine.withgoogle.com/models/SNypPJQH/";

		let model, webcam, labelContainer, maxPredictions;

		// Load the image model and setup the webcam
		async
		function init() {
			const modelURL = URL + "model.json";
			const metadataURL = URL + "metadata.json";

			// load the model and metadata
			// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
			// or files from your local hard drive
			// Note: the pose library adds "tmImage" object to your window (window.tmImage)
			model = await
			tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();

			// Convenience function to setup a webcam
			const flip = true; // whether to flip the webcam
			webcam = new tmImage.Webcam(200, 200, flip); // width, height, flip
			await
			webcam.setup(); // request access to the webcam
			await
			webcam.play();
			window.requestAnimationFrame(loop);

			// append elements to the DOM
			document.getElementById("webcam-container").appendChild(
					webcam.canvas);
			labelContainer = document.getElementById("label-container");
			for (let i = 0; i < maxPredictions; i++) { // and class labels
				labelContainer.appendChild(document.createElement("div"));
			}
		}

		async
		function loop() {
			webcam.update(); // update the webcam frame
			await
			predict();
			window.requestAnimationFrame(loop);
		}

		// run the webcam image through the image model
		async
		function predict() {
			// predict can take in an image, video or canvas html element
			const prediction = await
			model.predict(webcam.canvas);
			for (let i = 0; i < maxPredictions; i++) {
				const classPrediction = prediction[i].className + ": "
						+ prediction[i].probability.toFixed(2);
				labelContainer.childNodes[i].innerHTML = classPrediction;
			}
		}
		
		function readURL(input) {
			  if (input.files && input.files[0]) {

			    var reader = new FileReader();

			    reader.onload = function(e) {
			      $('.image-upload-wrap').hide();

			      $('.file-upload-image').attr('src', e.target.result);
			      $('.file-upload-content').show();

			      $('.image-title').html(input.files[0].name);
			    };

			    reader.readAsDataURL(input.files[0]);

			  } else {
			    removeUpload();
			  }
			}

		


	</script>


</body>
<!-- Copyright (c) 2020 by Aaron Vanston (https://codepen.io/aaronvanston/pen/yNYOXR)
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	
	 -->
</html>