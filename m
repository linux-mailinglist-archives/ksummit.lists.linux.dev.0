Return-Path: <ksummit+bounces-379-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244F3C36BC
	for <lists@lfdr.de>; Sat, 10 Jul 2021 22:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 63B171C0F3C
	for <lists@lfdr.de>; Sat, 10 Jul 2021 20:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A528D2F80;
	Sat, 10 Jul 2021 20:09:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1AC70
	for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 20:09:07 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id d12so13680435pgd.9
        for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pzNN+Uxlfe070ef6HWggh0SuVl0/DIF+UqV9DkmFEmQ=;
        b=ZUX2eS1+aQgRoyNVuJRTJ8VS+7ET/dn1Cc8Xre0Tl9O4pzESyvOHN6TwL2dBY5+R3N
         lTs96U6N6aGYRA8X0jO1ASb5aXVey2BR++uiCXbInZQ8aS8vQTZo+O35ISZLlIDvMYtn
         CuE/e5TSjv5hRf65lxrJzCBoRJr2YxoXHpfWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pzNN+Uxlfe070ef6HWggh0SuVl0/DIF+UqV9DkmFEmQ=;
        b=XHRHDBH79QbrqGfhwHTTkDFGX6GaEO8GPVbDAK4NCeTLNbrVImMCk13g44evMzJkgv
         s8pv/yMnrkfKbFzvU+XJ3FiJoCrEC6EGdog1+yOQSwLla0p3fpD2a/Z0MCUZre74HBWI
         k6lsYiPS4hbY6l7qGJhVhYDSaFjElJiZ9JlRawYKOlHaM4q8eqfG3cHq2AH0o+kL+xFM
         4YZ080ZnJukHZPPWE0dwV4HEmMeoPEZewaGESu8zPko7Ox+r0OKW2Mgp3E+BL9ZyHbcs
         /oPzWnFDC4j4iMGtkDf2g//4zfj2tyF8al8wTHAbtGy/G3Lpmm3nKz6d6A0+ffiOBxG9
         8bhw==
X-Gm-Message-State: AOAM530d19vGTOD2pM9kI1X0BM6ZyCNG5QtjUNiQLOhmG87Jcps6bPwU
	CrTg9moRjeyBE3ccgtrZFmArBQ==
X-Google-Smtp-Source: ABdhPJxRZ01cBptxDhXP5i4MHQvre+d+8hL+NtZH4Ibe36CaKj0ZLpiziUiFGb1wXfwA7uYPCO3Udw==
X-Received: by 2002:aa7:8f28:0:b029:312:3176:13fa with SMTP id y8-20020aa78f280000b0290312317613famr44922336pfr.53.1625947747108;
        Sat, 10 Jul 2021 13:09:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m13sm10173278pfc.119.2021.07.10.13.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 13:09:06 -0700 (PDT)
Date: Sat, 10 Jul 2021 13:09:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <202107101258.6EB4115D6B@keescook>
References: <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>

On Thu, Jul 08, 2021 at 09:49:15PM +0200, Linus Walleij wrote:
> My concern is still whether this really brings Rust closer to the actual
> problems we have and that Rust can solve. If the problem is really
> about real world security issues, I would ask Kees where the actual
> attack surface of the kernel is. He knows.

Oh yes indeed! Two big classes of flaws the kernel suffers from due
to being written in C are buffer overflows and use after free. Both
of these are strongly mitigated by Rust's borrow checking. The other
class I've been concerned with is arithmetic overflow (which usually
precedes a buffer overflow), and that's why I've been pushing for the
kernel's Rust to operate in Rust's "trap on overflow" mode by default,
where the exceptions that expect a wrap-around use a distinct API.

> It kind of matters. EternalBlue (WannaCry) was a horrific Windows
> exploit in that it shows us pretty well what kind of cyberweapons the
> intelligence agencies of the world have been constructing and
> stockpiling, and probably also used. We need to put countermeasures
> where such exploits are likely to hit, yesterday. Intuitively I would
> say any in-kernel network daemons, anything complex that
> responds directly to network traffic, is a good thing to fix. I do not

FWIW, wireless drivers have been a persistent source of buffer overflows.

I've been working on some changes to our memcpy() use in the kernel to
help address this, but it's not quite finished yet. Very soon, I hope!
But even these changes are just dealing with the "easy" cases where
the code is luckily enough arranged in a way that the compiler can do
the bounds checking. (The same goes for CONFIG_UBSAN_BOUNDS.) Rust just
makes the whole class of problem go away because of its borrow semantics.

-Kees

-- 
Kees Cook

