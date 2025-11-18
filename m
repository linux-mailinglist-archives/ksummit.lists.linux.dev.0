Return-Path: <ksummit+bounces-2636-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F844C6BA2C
	for <lists@lfdr.de>; Tue, 18 Nov 2025 21:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA1D34F11A9
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1E629D268;
	Tue, 18 Nov 2025 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Tf/NUbEU"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBA26A1A7
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497829; cv=none; b=hzpQYOj+M1kaaTJhAhQmFAHuMXe2WvMxX1R1aUp1yjqe3mbMObcyrBXKYDB3NJGBcZ+AEZku/ST1bt4JfsV8+RbEDSwg9RIHu9xygIAUIu6sMEo8qO4r+6YuIbF6j/EH0TvJoWjNfFpe9ro0whdH5Q4Qp2AHpPRVJh3hLNuFHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497829; c=relaxed/simple;
	bh=+ARpv9QE/JruhVH0DmV6RX5h+3Dc8d6svbyLopVahTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S37EB6gvy+U1wuGlG7ewsCTa8C24KqDEwDDGNouK09n3nkmyWVkS2K6WFI2JEfbFAQaLk8wqTfEHC5crNhfTSlzmFhPQtuLlVvB17rjJtKDYrRnq2Nm/krx3Q236vbWDRCmjI6DFIj/P0+Ily47c3MNAaKv1RdJBhO8dYp1djHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Tf/NUbEU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so720032a12.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 12:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763497825; x=1764102625; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zfnc0zwjdaQyaefF80P2aTcJmgzfCMP7iuMryViv88=;
        b=Tf/NUbEUKkYokgk17t31NK5U9RY/mdB+75G43fFCBfPpqgg0b569CXSwMXLv6x12qc
         nbFRuOswOF3KcBx17UTxdVcZyI8m18X5N6kLJG4yPmlfVSSZ56WYGOGl+JtFlY/8dEpE
         FdDA+GR9WtxQUqVeFIgfDVkq8Tq3KHXVDPk2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497825; x=1764102625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zfnc0zwjdaQyaefF80P2aTcJmgzfCMP7iuMryViv88=;
        b=CfSvYyDk4+D6LS7QGoqHCY2BTmT9aCvyR4ZbKg1+kDwuNwyvUaUdkzIY/f8yY+JvkD
         xw/O2kETwYO+yGQoChE217L6jbDghx82p9BMWIiwnk9/s9CQHGr7wPNo2GmSanYcJaeG
         woE/4U/2RuDTHWpRw1LduaaxgRVTWdJ2PMY0y/2IdZyEfEmH0aTdKAOuzozFr0djFEUP
         5ZYENP6daA2Qz8213eLevPFA04pLAUqoljieIIOAmm5I2reeLquKJWU0c91uKCObO1Qi
         CFw9wMeE57wCYmjXFtiDILlQEpdH6Z6DW1zN+yE7RAl0Ix34kQJ4K/grERoDYEEb/dwO
         mn+w==
X-Forwarded-Encrypted: i=1; AJvYcCWyllyWhzD6pROg2vjY9hPWkNiVEKybhrQv4t2O1mE3nsJ/m7z3Ks0wHBq3yPgbYqyEyytmH/jc@lists.linux.dev
X-Gm-Message-State: AOJu0YyCrF185E5HhCMg/bhfHOMepdnLkM+wE7cq4VcfcN3Ump5VeQu0
	CuCozpF1SKgJ8yjnDj+H0vlgSm2ba5r6J72VfUYDpOke0z1z17yOMh1VRUU6YFQaShXtacTg4+L
	nhQffdYQ=
X-Gm-Gg: ASbGncv4Di0lnmhEEOUnkFkpPo2f1mlKuUvTyV4xATpwiF3ftr7F0CjAkmvqLt5mJ+t
	MX4gNbiz4U7q4wla8yled0acZnTkhfBiQZ7ZW8SR4j8BAFXUjw14CVxKd4F/mAiyMHCXfmFmsvP
	k7PX9N/WtpfNgZKHWNKNIXMrQPolKgy0/1ItX5xMfqM2UlWOYxqXZl7/Q4EVIuJQxMs3zuQdpNA
	Xp1K7dvkJO9KbsEMKr+SYscLimjCf2aok/U2EO2HuglMsK6tj1u3qkw8gRbZHh2hLIFmI/pqGrx
	EgThevukC5A02e6g47F1SGaGNyMnZGr8codhXfHm1rzASAkMeGJuEc+Vv8cnFwquy9MnU+6SRMe
	7n7ZFJRQ0kjaz9wusOHe9Z6DLKETNggpEZ8P1aMpgJBnacSmcxtAjcs4Armos6qDvgwEZ5YNDH2
	Z4GcuvwgSfB1MkMYQ4NqohW8wwNmRSg+N6pT6Ki7d4hUoWddgVzwTP7gJ3CE6uBMKDaeLpWAI=
X-Google-Smtp-Source: AGHT+IHKF1CglFDXpRubmLzkf8MpEMbuIc35DYCacdzTgJFP5ciNYTH1S1E+JVo4fgT3+l48cZE4Qw==
X-Received: by 2002:a05:6402:20c3:10b0:640:b736:6c2f with SMTP id 4fb4d7f45d1cf-64350e8a799mr12647419a12.18.1763497825473;
        Tue, 18 Nov 2025 12:30:25 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a498102sm13596550a12.24.2025.11.18.12.30.24
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 12:30:24 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so719962a12.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 12:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5gq63fGggtyMWS2w8LvsYIsUXFLgR37KXTRa7uOm6vekx3djtc84Lst0jG3GwsXjL3bkcK3K8@lists.linux.dev
X-Received: by 2002:a05:6402:42cb:b0:643:1659:7593 with SMTP id
 4fb4d7f45d1cf-64350ea7e53mr15860670a12.30.1763497823834; Tue, 18 Nov 2025
 12:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org> <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <20251118141720.11c8d4d6@gandalf.local.home> <bff6d9974e50f7cb27cc2b150ecd6e5e2252ae54.camel@HansenPartnership.com>
In-Reply-To: <bff6d9974e50f7cb27cc2b150ecd6e5e2252ae54.camel@HansenPartnership.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 12:30:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjD1r5dr_b7gpuPdTXGdXAtaM6wHBSJyzi-Zfw3-cqR6w@mail.gmail.com>
X-Gm-Features: AWmQ_bnSJRdnjW7O8dYNf_O1Ez_rg_fXzQwlGD1K8n_y_W08ZYUfXV4O6V3_B8s
Message-ID: <CAHk-=wjD1r5dr_b7gpuPdTXGdXAtaM6wHBSJyzi-Zfw3-cqR6w@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 12:21, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2025-11-18 at 14:17 -0500, Steven Rostedt wrote:
> > I think the code could also be better optimized? I haven't run an
> > objcopy to confirm but now early exits do not require calling the
> > __free() function on NULL pointers.
>
> Yes, I can confirm that (at least from reading the docs not actually
> from disassembling the code).

Actually, I _have_ been disassembling some of that code, and most of
the time the compiler is actually good at eliding those things and not
calling kfree() with a NULL pointer.

Now, the reason for that is actually that we spent some effort on this
in <linux/cleanup.h> (and by "we" I mean mostly PeterZ & co with me
being involved in the discussions).

So you'll see those destructor functions being inline functions with
things like that

   DEFINE_FREE(kfree, void *, if (_T) kfree(_T))

where that "if (_T)" being integral to having the compiler able to see
inline that "oh, it's statically NULL at this stage, I don't need to
call any external function".

But yes, sometimes having the declaration later can simplify this all
for the compiler too. But the *primary* thing should be about making
the code itself legible and maintainable to humans.

          Linus

