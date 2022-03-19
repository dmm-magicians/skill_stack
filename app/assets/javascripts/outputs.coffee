# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#coffeescript.org/
window.draw_graph = ->

  lineChart1 = document.getElementById('lineChart1');
  myChart = new Chart(lineChart1, {
    type: 'line',
    data: {
      labels: gon.outputLineChartXLabel,
      datasets: [{
        label: gon.outputLineChartTitleLabel,
        data: gon.outputLineChartData,
        backgroundColor: 'rgb(75, 192, 192)',
      }],
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
  });

  barChart1 = document.getElementById('barChart1');
  myChart = new Chart(barChart1, {
    type: 'bar',
    data: {
      labels: gon.outputBarChartXLabel,
      datasets: [{
        label: gon.outputBarChartTitleLabel,
        data: gon.outputBarChartData,
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

  barChart2 = document.getElementById('barChart2');
  myChart = new Chart(barChart2, {
    type: 'bar',
    data: {
      labels: gon.wordCountBarChartXLabel,
      datasets: [{
        label: gon.wordCountBarChartTitleLabel,
        data: gon.wordCountBarChartData,
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

  barChart3 = document.getElementById('barChart3');
  myChart = new Chart(barChart3, {
    type: 'bar',
    data: {
        labels: gon.timeBarChartXLabel,
        datasets: [{
            label: gon.timeBarChartTitleLabel,
            data: gon.timeBarChartData,
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

  barChart4 = document.getElementById('barChart4');
  myChart = new Chart(barChart4, {
    type: 'bar',
    data: {
      labels: gon.selfAssessmentAverageBarChartXLabel,
      datasets: [{
        label: gon.selfAssessmentAverageBarChartTitleLabel,
        data: gon.selfAssessmentAverageBarChartData,
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
