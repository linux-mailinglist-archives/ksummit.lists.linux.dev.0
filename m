Return-Path: <ksummit+bounces-411-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484E3CEE2B
	for <lists@lfdr.de>; Mon, 19 Jul 2021 23:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4A8BD1C0E87
	for <lists@lfdr.de>; Mon, 19 Jul 2021 21:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811FE2FB6;
	Mon, 19 Jul 2021 21:37:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A7872
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 21:37:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mspu2-1lGmZc39qa-00tDrv for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021
 23:32:40 +0200
Received: by mail-wr1-f47.google.com with SMTP id m2so23752075wrq.2
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:32:40 -0700 (PDT)
X-Gm-Message-State: AOAM533lDni1LlewDNA7Kl5oBtB53FT92O0PGpaGR9XNr8A61Thtwqqo
	4ymzPvZTGNQkdQomyUruw/VLA2A6XtmCs21zd8E=
X-Google-Smtp-Source: ABdhPJz2olJ+tLlL4GV/h3q2wGnQmYDFxka5VgTLVB3MZnE+tOVTdorUXPRsaScpX7smakjyw2M2b6g8TDYOzTKQcKk=
X-Received: by 2002:adf:e107:: with SMTP id t7mr32080878wrz.165.1626730360405;
 Mon, 19 Jul 2021 14:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com> <CACRpkda8cD+BOjgE996PGDG8Tb9_7wV8j3AkTkYPLMmW9OS+iw@mail.gmail.com>
In-Reply-To: <CACRpkda8cD+BOjgE996PGDG8Tb9_7wV8j3AkTkYPLMmW9OS+iw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Jul 2021 23:32:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a19GJTi2kk9wf3q+=qfZGZxwjsAYuHjE=CkP5TtH4x6Yg@mail.gmail.com>
Message-ID: <CAK8P3a19GJTi2kk9wf3q+=qfZGZxwjsAYuHjE=CkP5TtH4x6Yg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oiUax4twP5OKnPgxpdp/ukcQc05RtTRXqkjuXHEIg46IwLbr53H
 PMH1BfWSwR5Ytv5uqyrtmkQylphGZEEa91yGK2qeWVKRv+r9mzn4yyMTkr9P7/47sLTqGwl
 hDxMb6YT5m9JeT9xvP7YJ7BZufahBzzaWTdGXXfzDNEJWVQgR7VB2Gyxy2rnGmBjZKPTkK4
 CMWZGXn3R26oAWJmcCoig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bml9VN04EoM=:nlBAegGrEX1CiTNY/nL8ds
 9VNu3sVxk++oZxuiuLxDBJFv2miiLlZRuJsM70jW1kRFPLz8keuBIOTN7yXCE/QEvxm/6t2Nc
 hzrww0r++f0zMG0R6ESsMdFw1yoHbTkJVZqErQfGO37VBVANtLjR0mOx35fdzZnUlpf4QJkLA
 8r1V62G9pefUw8xFiaTj3tF2d6SO3f3IBAeAfZZB7XMEYsosbixAwKJ8MpfhhMkG3t/QOdoOE
 rSV2S728uLUUzNAlp1vEMrGumH5cspAjNdIf0OzpiSFMRkkfWwg6Tg3BkZJPJbC2UJSWbA8fk
 T82axqxji9IDzEx9I3nvtSNoAeKwF2BfJOiiRbWdyrxWNheJnFaO8ONLhxmA26H7Gwwtnvmwq
 YwClj9yiO6o8KVuuYZWISZTVgBukyhjtFuJXiy11+EVi/lX2v/Su1GBK59qA3NXOOrUQt6fXF
 TJap8lfMNnGhm0oeQAK5pnAErC6j8Fhrc7ZQ/xUxVEiSYhEO6TZMTB1syBhCKk8RFojKJeT0R
 bD3JCl1p0KUPJ6c8rIG9nyELABfzP95sl+QG4kRdPA5yXFmE1BAyeYbbIquhOGUkwCiXFaSJa
 dH6kmrUqjgkKvlzj9TBXbKnKlG31r/s+I1F1vB/uvxLwKzfjG9bBH6TUC1MtOE3JiQEXgyNX0
 FTVkkoN8S2YSMfET/om2JRUJWIWhY8wYqCXUsZttckpLKozJCwVlvVttnWO23TB0nuZIhudT+
 Pi1RstSz0w8QwblwBlis8FIU4JJpybAXeg3WEssx1dv/rqMoMYStIjsefU+OmsARY2Uqm50Z2
 ovLXLiKCUDJ46jm6cOkKzfdgrR6WqjKPEqc3xVU9DqOUf37Ki7aMi1zPTLhmM45QQgzFQIGjP
 0+8l6HrLm1jQ+dfuhrAGE7cHFpGiaOvBEed6xXVukxmwt53NzSSFMezGZjfHD0HymSxLQOkrT
 Gtr6UCNYIqpsfiVc3RHOQLmFb7R+33jaJZlwCQa2mUjju2Q1XC8KF

On Mon, Jul 19, 2021 at 4:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jul 19, 2021 at 4:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > - What's with all the CamelCase? Is that enforced by the language, or
> >   can we use the same identifiers here that we have in the C version?
>
> To me it looks like that is used to distinguish classes,
> factory methods and such, it actually seems pretty intuitive
> for the perception to me, but maybe I am already Rust-tainted :/
>
> Yours,
> Linus Walleij

