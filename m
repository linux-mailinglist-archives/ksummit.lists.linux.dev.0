Return-Path: <ksummit+bounces-412-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9B3CEE2E
	for <lists@lfdr.de>; Mon, 19 Jul 2021 23:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DF81C1C0E2B
	for <lists@lfdr.de>; Mon, 19 Jul 2021 21:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24D32FB6;
	Mon, 19 Jul 2021 21:39:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0C872
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 21:39:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MjSsm-1lQADR1bPG-00kzWQ for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021
 23:33:55 +0200
Received: by mail-wm1-f52.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so337366wms.0
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:33:55 -0700 (PDT)
X-Gm-Message-State: AOAM533kRsBYWSevetB7xYbXNQ/nEyIHPMPP+lV/8rNiiLODp4DKMEuD
	rh4dMLYfBOBf89EFovCCENJ7xw9oM/NWv/OF5tw=
X-Google-Smtp-Source: ABdhPJyyyN2YRRDWrcX2gJFcOIbb4B743z+FRfD9AmKxc//bay0Nqh5L9feHQ9cF+lh+Zpe7yIxyHrytdU0j4pDS9ac=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr33969993wmh.120.1626730434876;
 Mon, 19 Jul 2021 14:33:54 -0700 (PDT)
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
Date: Mon, 19 Jul 2021 23:33:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0EjQesQi1mUq5D5ATYMW+sy6gAxNbsE8Sq9vU4j5UrCw@mail.gmail.com>
Message-ID: <CAK8P3a0EjQesQi1mUq5D5ATYMW+sy6gAxNbsE8Sq9vU4j5UrCw@mail.gmail.com>
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
X-Provags-ID: V03:K1:wXNKqkCIKWqEw7538tgCxKkKiRi73JqG5Lj3nyZwewbJJgBmneF
 A/dgYvKhWebBRPf2WHCnaJt8KuYr0+IDFYvDiLQIIcSzSDczonCnHBVPG2sk0YGU1OLJU+2
 cw9gdNNn5eMAst9O01KwQ/krA6aglni3S69+Tjd//LPxoOWshvf9RJdWbs5Qb/7T9Xomkc1
 xUeiVabSQ1grSn1nKlWnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tDkODyIWAyA=:n9nkQzl5Ynz1tDfzCOGvsZ
 vLhtB1Th0JNk86WgIFmKmkBPcoD/9/4aQsejwGr6M7sxOKyqGwwMW9Wc71QsRCkKl1h4cNNOF
 s0B+Mlfj7mOm+jQhjCNFM/A+Rve/YlSdw1d48HsHhT7VgpCYpe27Zw3N45wmtivrYicbLhbhZ
 UmNM/j2h5ONmUlD/q/4OQMjkvKuqy7i9fi5WNWE8lbD8IksL76UtddZmu6nJ5r7Wtg952O7dW
 1cs+9VB+Aa8FscYFfLphTyahgSPwFyDXTAOrMqNnAqRK6JlfmKLuINmT/dtcABucYmMGXJjru
 CCzOrST77+vZIHZ9sLIheKF6DAzTLMzXv+nbZ/ZoqEQax8kJUq1/cozBzkg8MAMGC6CxlFPwv
 qSY6KCddMPUzXALwYQusFOb+Ji15KLKH7zw8tSzR3WzW1mr66ttRe/Il8mTJ5SkkBAfGIDuhJ
 Lqjp4GTmxqDNezG20xPznSEcaZIim+OSU5MPv0AJ3V3ah1vzqfXpDx/wypUhVXJ1OPriyWA1V
 FNUwVQ7/QnKXo6o8ikhLDHPKcQkM4U3kzXkx8BRZrKQBloBE+ZGOBnCHer5XmtNv/DOMVFz9f
 6ppEIzcXg1gJE4Sn80v1aT98vPVoreZyOWEl2KzGg3t516rJWTYsZGDYfHZKNifrgBg5cPYYg
 ErRlReEGstEK2f2BNIEsoQF0k3qCXQQmSTHqzzB/dQEzi/+kjgu2/VDehDfKomxMeD+nQu1NG
 YXgb1VOMOJ1TU+3o7OTQhL+5z23g9Au2+roWcHfzYQLfsAMdnX/13cqJKObyiJPKZMQcLKrdC
 jV0BSClS4F92N9r2oe3qaR1O/xDZcS8N1c0nFk9iWcXmJnFY2LziYs6cz4rgA2ZtcMWLaPG0c
 lTdqV1OjvpemNP91qGhJKY1w7hWGaa07I3ICRFj0iWktTz7+Lfox9kZWWih4vrCCiSKkCfdz+
 sm/htTOEql4V/jmOctLsAZVeOW0oPkUnAl3flL9zJWuJv0DVFF78u

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

I'm worried that this makes things harder to grep for, and to document,
when the same structure is used in both Rust and C.

       Arnd

