#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static const char *WEEKDAY_LABELS[7] = {"Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"};

static const char *MONTH_NAMES[12] = {
    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
};

static int is_leap_year(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

static int days_in_month(int year, int month) {
    static const int dim[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (month == 2 && is_leap_year(year)) {
        return 29;
    }
    return dim[month - 1];
}

static int floor_div(int a, int b) {
    int q = a / b;
    int r = a % b;
    if (r != 0 && ((r < 0) != (b < 0))) {
        q--;
    }
    return q;
}

static void add_month_offset(int cur_year, int cur_month, int offset,
                              int *out_year, int *out_month) {
    int total = (cur_month - 1) + offset;
    int year_delta = floor_div(total, 12);
    *out_year  = cur_year + year_delta;
    *out_month = total - year_delta * 12 + 1;
}

static int first_weekday_of_month(int year, int month) {
    struct tm t;
    t.tm_year  = year - 1900;
    t.tm_mon   = month - 1;
    t.tm_mday  = 1;
    t.tm_hour  = 12;
    t.tm_min   = 0;
    t.tm_sec   = 0;
    t.tm_isdst = -1;
    mktime(&t);
    return t.tm_wday;
}

int main(int argc, char *argv[]) {
    int year, month;
    int month_offset = 0;

    if (argc >= 2) {
        month_offset = atoi(argv[1]);
    }

    {
        time_t now = time(NULL);
        struct tm *tm_now = localtime(&now);
        int cur_year  = tm_now->tm_year + 1900;
        int cur_month = tm_now->tm_mon + 1;
        add_month_offset(cur_year, cur_month, month_offset, &year, &month);
    }

    time_t now = time(NULL);
    struct tm *today = localtime(&now);
    int is_current_month = (today->tm_year + 1900 == year) && (today->tm_mon + 1 == month);

    int start_wd   = first_weekday_of_month(year, month);
    int total_days = days_in_month(year, month);

    printf("(box :class \"calendar\" :orientation \"v\" :space-evenly false\n");
    printf("  (label :class \"calendar-title\" :text \"%s %d\")\n", MONTH_NAMES[month - 1], year);

    /* Encabezado con los nombres de los dias */
    printf("  (box :class \"calendar-row calendar-header\" :orientation \"h\" :space-evenly true\n");
    for (int i = 0; i < 7; i++) {
        printf("    (label :class \"weekday-label\" :text \"%s\")\n", WEEKDAY_LABELS[i]);
    }
    printf("  )\n");

    /* Grid de dias, semana por semana */
    int day  = 1;
    int week = 0;
    while (day <= total_days) {
        printf("  (box :class \"calendar-row\" :orientation \"h\" :space-evenly true\n");
        for (int wd = 0; wd < 7; wd++) {
            int cell_index = week * 7 + wd;
            if (cell_index < start_wd || day > total_days) {
                printf("    (label :class \"day-empty\" :text \"\")\n");
            } else {
                int is_today = is_current_month && (day == today->tm_mday);
                printf("    (button :class \"day-cell%s\" :onclick \"eww update selected_day=%d\" \"%d\")\n",
                       is_today ? " today" : "", day, day);
                day++;
            }
        }
        printf("  )\n");
        week++;
    }

    printf(")\n");
    return 0;
}
