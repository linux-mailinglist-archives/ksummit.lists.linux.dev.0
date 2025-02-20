Return-Path: <ksummit+bounces-1754-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA4A3DB9F
	for <lists@lfdr.de>; Thu, 20 Feb 2025 14:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81FCB1706CF
	for <lists@lfdr.de>; Thu, 20 Feb 2025 13:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173701F9F62;
	Thu, 20 Feb 2025 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7qt5bsq"
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2D1F55F5
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740059212; cv=none; b=k8Ydvd/tKxWBj/o30IdKBD9u8+BQnCr3hQwtFkvv4du871wX0noDW//elFyaVx58TVpjExqw4FrI14kqPBb/gNe1tq88HOm/lfWZnx5UBK0PemmKIMaurmW1GJn1IDxIShWRF8CZiIFomWyYrmzDXZeqOUNV5vqL06UWCvD2O5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740059212; c=relaxed/simple;
	bh=1jVbThmX/xBa44klFEKjAJ5W34MO3vftIlESOdgboYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1ZyUSQeTfOBcBhFfBQpl6pmifQH/+bRzBQvr1IgpKPEK0AGqMKvTnNnB59r3B86Vkr5LNmFKcQxfM73Ui4aeH/1BC6tupLf34qN+79jZ2sj6A83Sy1/bjJWxpX/YL7qLoU/d5gL/z6CqoU6GrvaKTYrFE8YgntELn8QDHWNv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7qt5bsq; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so1887089a12.0
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 05:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740059209; x=1740664009; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zn8iEIUMrS40tjZsG1qyBPqsWfjDSZ0FtFQ9slyGvJ4=;
        b=P7qt5bsq3WdruzL4t0YXU+cDCPvZdmqqXpQ6tfHhzL3XwqQ4SzZKV04blDgEFPKC2b
         EdRhw9abEg2bjX4BokbGrlzKrlK/TY81+QL4LE4+eI8fTM/bZNZxtlYHPTZSzRqPYXNj
         maDwCdLpvUCPsSqVCFxKtoGjiYxqJPvGPMFh9NYk6wm2z+7/GKNQFk1clTt0EEDJc8vY
         sKJiwnR7DuvYYXuSrB8eywf4EoYe688T/VxJSmNERQFaMkfcytqOvFv0CcbjihwxKfJh
         qocxIpJxp4EJhRSmhD0Nuf6dJlBMxlzlLu2N1481rTtiwj84LhN78R900V2MMIBArLKQ
         MCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740059209; x=1740664009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn8iEIUMrS40tjZsG1qyBPqsWfjDSZ0FtFQ9slyGvJ4=;
        b=s+E+bA5mcrnVv5JsZbhdiZuxQYOLxiSRvwMt8pZbxP4WgF3Pb5QKPA+bL8QB+8o1it
         hK470ZCFq39XiEJTEcT0gB3uNj0yHtAkl6YgxTmCu3cEKZzMRy8YvFF2Bu6NDTeVx3w+
         vYkk91TsSVQfzzwO9lfJ/dAZTV36muxT/oCu0xCFY6GQyL0m0mZ5pj9lKjuP3tkHBUiK
         qaFGYLk2RY9w3FXmgQtbaAwo9iBsT1WUDJ5D4uWtDLILsDmG229bZrGVf+Wt/a3n77br
         66qJWCuClyiltSEhLkIREnLXgE2AnSJXw0GTdvJy91t2G6H3TsjE8oXwaxaLnyUHdK2s
         vz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQqdP7Gnh4T/qgOKNpiqcIXwU1aHZ43QAznLyWdtPunglxw9DdFlEts+1oY2CgeUfRoFWXTuqd@lists.linux.dev
X-Gm-Message-State: AOJu0YzHucMpTszCWhD+agzAIcj/1aFg6IC2rITKfrP6h31AYXaKCN6t
	DsAYlI55Yrof6oAIq8t/no/vE2Lk4qmHVSrRTYphXNbBNa3dJ51W81wwc44DzvY=
X-Gm-Gg: ASbGnctIEa56YWGF/E6NQm+/5V44hnqWrKaoN+33/TtAMH+SbIhMW2EaiFD3r+SEanM
	LlLdy9eTLK9d726Lj3Z+RKB5G1Byjx5O60X0EofTxvTeJjwaf6mxAuJ2E8TDqhXyoWUeds0UxW/
	jyjtf5BNnlc1jVRxZZeHKfX3BwlYDizGeC7631ugoWdLZoWtX1tKRIudws0vcxMZB/SYSIUCt1p
	Di9+PwchfmqGPItNhAb5lnWM+t0tP6vBSVO7WF0EmV6fBzCgdOh/H/ZQ9mNAs4lrM2mZq9QBc5q
	31cVcz48kQvwHP7jmWOt
X-Google-Smtp-Source: AGHT+IEfkrRQ85xe9pOj5R5EwLaYpo72DL1cc79Csvepxg+wxeNncqBoFZXg3h/koqsH8dAFU2C0hg==
X-Received: by 2002:a05:6402:40c4:b0:5dc:929a:a726 with SMTP id 4fb4d7f45d1cf-5e0a4bae4bemr1740318a12.26.1740059208978;
        Thu, 20 Feb 2025 05:46:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1b4e80sm12119627a12.13.2025.02.20.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:46:48 -0800 (PST)
Date: Thu, 20 Feb 2025 16:46:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev, Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: Rust kernel policy
Message-ID: <962fa158-5315-4d93-afb1-8a1c08787ad8@stanley.mountain>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>

On Thu, Feb 20, 2025 at 09:57:29AM +0100, Martin Uecker wrote:
> In particulary, I have a relatively concrete plan to have a memory safe
> mode for C that can be toggled for some region of code and would make
> sure there is no UB or memory safety issues left (I am experimenting with
> this in the GCC FE).  So the idea is that one could start to activate this
> for certain critical regions of code to make sure there is no signed
> integer overflow or OOB access in it.

I don't think diferentiating between signed and unsigned integer
overflows is useful.  In the kernel, most security issues from integer
overflows are from unsigned integer overflows.  Kees says that we
should warn about "Unexpected" behavior instead of "Undefined".  In fact,
Justin Stitt has done the opposite of what you're doing and only checks
for unsigned overflows.  He created a sanitizer that warns about integer
overflows involving size_t type (which is unsigned), because sizes are
so important.  (Checking only size_t avoids probably the largest source
of harmless integer overflows which is dealing with time).

The sanitizer has a list of exceptions like if (a < a + b) where the
integer overflow is idiomatic.  But the concern was that there might be
other deliberate integer overflows which aren't in the exception list so
Justin also created a macro to turn off the santizer.

	x = wrapping_ok(a + b);

What I would like is a similar macro so we could write code like:

	x = saturate_math(a + b + c + d * d_size);

If anything overflowed the result would be ULONG_MAX.  In the kernel,
we have the size_add() and size_mul() macros which do saturation math
instead of wrapping math but we'd have to say:

	x = size_add(a, size_add(b, size_add(c, size_add(size_mul(d, d_size)))));

Which is super ugly.  Maybe we could create something like this macro?

#define saturate_math(x) ({             \
        unsigned long res;              \
        __trap_overflow(label_name));   \
        res = (x);                      \
        if (0) {                        \
lable_name:                             \
                res = ULONG_MAX;        \
        }                               \
        res;                            \
})

regards,
dan carpenter


