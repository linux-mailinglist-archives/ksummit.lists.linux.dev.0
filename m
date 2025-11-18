Return-Path: <ksummit+bounces-2634-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBAC6B9FC
	for <lists@lfdr.de>; Tue, 18 Nov 2025 21:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 214CE4F1795
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC8D3002C5;
	Tue, 18 Nov 2025 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b24r5Jwt"
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DB2FB09C
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497405; cv=none; b=ch8sTmnrCwzctY8nGUIw7GiWfxqvr1OsxSC2A8Pl8efyzof0oqboE2xxJxA7ZuNvNA/uW04JeZ1ZcwiL+0JZcCQCX7bUZvjQ3mveuOOUCPoA9SM3L6dIuSkse3lo6zo+XMlAy20suSetXilC/ywsu8GhWf0wSEPQ53HSZfAX3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497405; c=relaxed/simple;
	bh=wr4ENxHky8JI9oT3lG+bSS77yM5Uei4l1s9DKVKrmrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2BwQ3EC8V4y2bjje3+ilFxRWaA3lM1zN+0g4X4ybY2QvJ5QIZYZBR3niLrj+MNRduofoN3muIsSy9UQl0Q6rH1C3EkKjn9c9+AvucSrnYe3fANKNLCbQLsHilQZSMIensRg7F3qrKD/YOUgatdVl5LXmVmA6hlTdiXk5KEIcyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b24r5Jwt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so10474461a12.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 12:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763497400; x=1764102200; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6vYJ+y7dq3mVa73ifraxNO4rqf1UZXMRNDFMTMivdL4=;
        b=b24r5JwtoS7IhubHDNKqGRpN93tCJGrNTq8Ds/fJcTfeIbDDjfDnRiClxCHAoFn+9D
         FutDfy5aP2xgtFBibHyt4IgUP9qH6Z9nttowgra27n+gYM0IfzXMcpZxorBvfKt7o94g
         qfLjtr4x/fhfdfTajWmzz9GcIrtYCY2ejyyi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497400; x=1764102200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vYJ+y7dq3mVa73ifraxNO4rqf1UZXMRNDFMTMivdL4=;
        b=CI0Zvkbe1BskMLYRyJL0uaSg+hTe6xsBZrkSnp+8L10FuXs4YoNHSYxY1y8yae2gt8
         JVBZ41P2mTNYlipNw88aKcdIXLZafpWB32VM4GdWhkUwK3u+XsFWcpvcfupFDWvVy9vG
         odNZqVhPDhqZzvjrvHWYJDXjcQVTdJ3XUNQCS3BSdx+d1dbjDkbji50u+sD59UmX8FuH
         +YrVJvm0HrDEdeJQXl6V2xdaqa5X/wJblC/ASv0zmQEUZ4Bf+r/0Z8MMbb4ZAVLFe70g
         lBkEjp5ZI/FwKpBEdKue4tu9LdvqTXnnjUAoeJSLeDvVafdPeDdiq7sU5Z/t7WYxpSYY
         2UJA==
X-Forwarded-Encrypted: i=1; AJvYcCUmnj5BDhb9T5euzcl6/KxjddpKXZCOoHL9nRTIkiz3c68azih5r/PN7sjmPiru7/a8keYjMCH2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9HdKp3PGgRjurhy37fOFR3eI9mQCkR+RzINoaYOt8l2sLtMHJ
	pwrXspuvWKxhrxo5yo71Lhv2odP+AV8oPP72jQ+c/6a+wdw3OHa0b1y22OCFLNsDKAZQFLY5kEj
	bWCQ5Q4M=
X-Gm-Gg: ASbGncv38+8L2ukgaNg+gP3XQUz0nMdt/ZFVHuWwPp9ClNmpZVz1lPjyf9ZsnnlsbBc
	GZNFmvIFULT2EqpCsDQZc8YN/Lft65umophwGNFJ8sBsOgkwxAxZyMXwsY8dm7cOfd2SGHz2ox9
	7AbvR1hr9rNObnwHGrV58qveCfDB0RLFyzh7LSaiqqJkyUDXItnM17YiV9k3sgH1iNfkBaVJWI7
	bnd0QkeS1OumHIEkcZHz90cpxTXC+lLQsc5AdR/H5Hzt3f3xZp82b6Cp++wX7z7b9l2QBOAFOus
	t346B4aOSKN+mfOKWdnTAmHLzrNPiThIU1uCG5oKTqk1YWJnyQUyTr1LaSmcuJQiqVGGW4M71/7
	CpqGIJLrjA3XSUsV/jEbiVvZ5gLcCsu86FtD3XLNL1JVQasK2DY0t4bVyB6Cq2uzmBos0Y4AW/4
	+a8jqjGALwTTeFY7tiRMansNwKiFshdV2Zj7eGkegVlnGTaSEVE1/IwtBrJnHE
X-Google-Smtp-Source: AGHT+IGwMMilmun+g33MlO0trBk1J8bjyIQQoBw/6RBVKVA8QiDORQ3g9eStEzL58OXRFHNkpsPZ3g==
X-Received: by 2002:a05:6402:5c8:b0:63c:3efe:d98a with SMTP id 4fb4d7f45d1cf-64350e88869mr15934708a12.32.1763497399799;
        Tue, 18 Nov 2025 12:23:19 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28bbsm13137416a12.28.2025.11.18.12.23.17
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 12:23:17 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so9852198a12.2
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 12:23:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOKO4xJSg8u39MM2C/Ox2qlhH/Tlb8qGrc0jn/+ccpz2BLwyR25zikrWXS86O6mZ3ZbfUWbKBS@lists.linux.dev
X-Received: by 2002:a17:906:9f8f:b0:b73:7fc8:a9c9 with SMTP id
 a640c23a62f3a-b737fc8c1d0mr1343053166b.29.1763497397486; Tue, 18 Nov 2025
 12:23:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org> <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <20251118141720.11c8d4d6@gandalf.local.home> <CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com>
 <20251118145618.7dd829f1@gandalf.local.home>
In-Reply-To: <20251118145618.7dd829f1@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 12:23:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=whQ9kzJWFrCY9C3bPkdfW5Zb0TdvKNdPCdzPSnrzHyhVw@mail.gmail.com>
X-Gm-Features: AWmQ_bl5ALzsXAGVUwi_t9a0eRt0XZ6msjnYRdv-5Ccak3Tx_xztqUMTcpjocfQ
Message-ID: <CAHk-=whQ9kzJWFrCY9C3bPkdfW5Zb0TdvKNdPCdzPSnrzHyhVw@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 11:55, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Doesn't look nice. I wonder since its the first allocation, if doing:
>
>         struct ring_buffer_cpu_meta *meta;
>         struct buffer_page *bpage;
>         struct page *page;
>         int ret;
>
>         struct ring_buffer_per_cpu *cpu_buffer __free(kfree) =
>                  kzalloc_node(ALIGN(sizeof(*cpu_buffer), cache_line_size()),
>                                     GFP_KERNEL, cpu_to_node(cpu));
>         if (!cpu_buffer)
>                 return NULL;
>
> Would be acceptable?

So no, I do not think this is something we want to do, because that
thing is just stupidly complicated and as such I think it *wants* to
be broken up into multiple pieces.

But this is also literally *why* I was talking up that automatic type
thing, because I think that together with a few helper macros, we
*can* make cases that would otherwise look like the above horror-show
actually work really nicely.

Now, I think that your crazy case that wants to do alignment etc may
never be a good example of this, but for the simpler case of "I just
want a normal allocation for this" a couple of helper macros would
make it quite nice.

Because in the simpler - and I suspect *much* more common - cases, you
could easily end up with something simpler like

       auto cpu_buffer __free(kfree) = kmalloc_type(struct ring_buffer_per_cpu);

and at *that* point I think it's nice. But please - not your horror-show.

Because if you need three lines to make one allocation be legible,
just separate it out.

                 Linus

