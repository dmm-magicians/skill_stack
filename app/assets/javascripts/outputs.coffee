# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#coffeescript.org/
window.draw_graph = ->
  ctx1 = document.getElementById('myChart1');
  myChart = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: gon.xLabel,
        datasets: [{
            label: gon.outputBarChartTitleLabel,
            data: gon.data,
            # 棒の色
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
            ],
            # ボーダーの色
            borderColor: [
                'rgba(255, 99, 132, 1)',
            ],
            # ボーダーの太さ
            borderWidth: 1,
            # マウスホバー時の色
            hoverBackgroundColor: 'rgba(255, 99, 132, 0.5)',

        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
  });

  ctx2 = document.getElementById('myChart2');
  myChart = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: gon.xLabel,
        datasets: [{
            label: gon.wordCountBarChartTitleLabel,
            data: gon.data,
            # 棒の色
            backgroundColor: [
               'rgba(255, 159, 64, 0.2)',
            ],
            # ボーダーの色
            borderColor: [
                'rgb(255, 159, 64)',
            ],
            # ボーダーの太さ
            borderWidth: 1,
            # マウスホバー時の色
            hoverBackgroundColor: 'rgba(255, 159, 64, 0.5)',

        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
  });

  ctx3 = document.getElementById('myChart3');
  myChart = new Chart(ctx3, {
    type: 'bar',
    data: {
        labels: gon.xLabel,
        datasets: [{
            label: gon.timeBarChartTitleLabel,
            data: gon.data,
            # 棒の色
            backgroundColor: [
                'rgba(255, 205, 86, 0.2)',
            ],
            # ボーダーの色
            borderColor: [
                'rgb(255, 205, 86)',
            ],
            # ボーダーの太さ
            borderWidth: 1,
            # マウスホバー時の色
            hoverBackgroundColor: 'rgba(255, 205, 86, 0.5)',

        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
  });

  ctx4 = document.getElementById('myChart4');
  myChart = new Chart(ctx4, {
    type: 'bar',
    data: {
        labels: gon.xLabel,
        datasets: [{
            label: gon.selfAssessmentAverageBarChartTitleLabel,
            data: gon.data,
            # 棒の色
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
            ],
            # ボーダーの色
            borderColor: [
                'rgb(75, 192, 192)',
            ],
            # ボーダーの太さ
            borderWidth: 1,
            # マウスホバー時の色
            hoverBackgroundColor: 'rgba(75, 192, 192, 0.5)',

        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
  });
