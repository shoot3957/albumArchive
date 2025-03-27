$(document).ready(function() {
			
          const albumNum = $("#albumNum").val();
          let isLiked = document.querySelector("#isLike").value == '' ? true : false;

          updateLikeButton(isLiked);

          $("#likeButton").click(function() {
              $.ajax({
                  url: "/albumArchive/like.do",
                  type: "POST",
                  data: { albumNum: albumNum },
                  dataType: "json",
                  success: function(response) {
                      isLiked = response.liked;
                      $("#likesCount").text(response.likes);
                      updateLikeButton(isLiked);
                  },
                  error: function(xhr) {
                      if (xhr.status === 401) {
                          alert("로그인이 필요합니다, ");
                          window.location.href = "/albumArchive/login.do";
                      } else {
                          alert("오류가 발생했습니다,");
                      }
                  }
              });
          });

          function updateLikeButton(liked) {
              const button = $("#likeButton");
              if (liked) {
                  button.addClass("liked");
                  button.html("♥");
              } else {
                  button.removeClass("liked");
                  button.html("♡");
              }
          }

          $('.tab').click(function() {
              $('.tab').removeClass('active');
              $(this).addClass('active');

              $('.tab-content').removeClass('active');
              const target = $(this).data('target');
              $('#' + target).addClass('active');
          });

          $('.tab[data-target="tracks"]').click();

      });
      
      
      const editLinks = [...document.querySelectorAll('.edit-review')];
      console.log(editLinks);
      editLinks.forEach(link => {
        link.addEventListener('click', function (e) {

          const reviewNum = this.getAttribute('data-review-num');
          const reviewItem = this.closest('.review-item');
          const title = reviewItem.querySelector('.review-title').textContent.trim();
          const info = reviewItem.querySelector('.review-info').textContent.trim();

          console.log(reviewNum," + " ,title, info)
     
          
           const formHtml = createForm(  reviewNum, title, info);
           console.log(formHtml);
         reviewItem.innerHTML = formHtml;


        });
      });
      
      
      function createForm( reviewNum, title, info) {
      	   console.log(reviewNum," + " ,title, info)
          return `
              <form name="editForm" action="/albumArchive/reviewUpdate.do" method="post">
                <input type="hidden" name="reviewNum" value="${reviewNum}">
                <input type="hidden" name="albumName" value="The Album">
                <label>제목: <input type="text" name="title" value="${title}" required></label><br>
                <label>내용: <textarea name="info" rows="4" cols="50" required>${info}</textarea></label><br>
                <input type="button" onClick="test(form)" class="btn btn-edit-complete" value="수정완료">
                <input type="button" class="btn cancel-edit" value="취소">
              </form>
            `;
        }
      
      function test(form) {
        
          // form.reviewNum.value는 이미 createForm에서 설정됨
          console.log("reviewNum: " + form.reviewNum.value);
          console.log("title: " + form.title.value);
          console.log("info: " + form.info.value);
          console.log("albumName: " + form.albumName.value);
          // 필요하면 폼 제출
           form.submit();
        }