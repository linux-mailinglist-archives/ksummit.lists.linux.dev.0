Return-Path: <ksummit+bounces-2630-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E34C6B6AA
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDD774EA2B5
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F66C2E1F05;
	Tue, 18 Nov 2025 19:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DgPGgh+m"
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADF298CC0
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 19:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493770; cv=none; b=LzVqg2tIkchspQZQjg3dOd1uD85vabXxo9R+5m4TSIIMf7LgRaC2c+WzxoQoO0t8zBsN9TJQPxy6mWNMxBD6+xt9Kp4vYcyMruYIzZrYPZYjzoVXGSq50UGgNAYhguxEMjbFy6kiP36+6edp9rGm4dlk4Y87yZCOE1il68OCwBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493770; c=relaxed/simple;
	bh=H7ueogA/CEUjxIYVhD13JORkN4NsS5DUUTRdPtHi4KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqKUVMv3wi/ET8hVfDWhikIJWb6bWlr7S+c0LvLI5olA+/jNBwPDnVPZNBWrBHPe0RK0KbaVukUKdlW9FzBzvNIESW8i/zyI8QpG0/qKh8NuGNqd2ttvam+stplIdah4Dk41FfD1bDn+U6GV7QloR3dcREf8dRjuJauFbyGgBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DgPGgh+m; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso8791933a12.2
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 11:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763493766; x=1764098566; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Bd4fUY4LM3aGQ2ify9fvgMri+twlE/MRV+Nyn82PQk=;
        b=DgPGgh+mh1PHHvlOPisUepv3bksYBrJrF4vfS1R9IaBrHUxlfrRm9NFwWtyBA/q8+A
         7YH9pQlAqDCuT8T25HO2ICzCbG9vq/cxsILEmLB1fusmMSwiizi1F/dFThCPQiIoAT+c
         N+Sz/ZaUXkRf8Y4lMpRhmqCqmtlIXuUNACSc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493766; x=1764098566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Bd4fUY4LM3aGQ2ify9fvgMri+twlE/MRV+Nyn82PQk=;
        b=Kew1/5afml9FLnoWVaU2nHY1SuWHqxutONGHXKNrlvIFPJshpVqAvbaPM0xm4Eylyx
         xQhqh98aqV2ebMleP3zfsTDgG6xYYBBzkSY8zvhzHRHxudTqHv6xdQgsjtF8eTn7pPuc
         UoFvzKDfUdGz4YDkFEMN+dmIaLfdLjR2LUIpvp2/c4uYKyXjZMhyrZ2RKqE8iiiEW3I4
         /nQNVCzX5U7m/r/VECeXyTL0axffjhjUstkObG4GLvGxdpGH9Ph5UfTZU/n/4gclqG81
         XLjbcO5BpVpVjZnI0G9tJiRbQp/1quNCZQLkDIGAOCfzVfpaVribnRri+Kvz2iijYzh3
         X9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy/z/nQ7yMvPSA5dMHE3YGMcnEp34K34LrnhnZYYCOYHAZj4KkmR95KupTu6UQV3x1fT3SDan5@lists.linux.dev
X-Gm-Message-State: AOJu0YxeBiFmXjx6Ttok4PuNVWsAp/RKAyvphrHxcL/m0w7SRbp5/91H
	UqD9qgbhMBdXHcceG1VEGVEq+M9DxkMfiAkb29nhIFHv8XcTv87tKwdwWCLcaclimQDLVTDSS1W
	+WHF4NV0=
X-Gm-Gg: ASbGncs6N07eUpetsTg7wUb46OfXZteZwgkgqY0fWttSxrOZ+HJ+zUT6w44e8YfP+gP
	j0ZB79LtbCpOfeEBmb47VEa86QUpLm8cxadDRpRtBSBBcwaNesjGuwxsDOY9GnwpZFjzNAdl96a
	IYw5IS8jlZEZObokxnRAmyB+RJUrxZYN4xiyZnHjg+ngw2eO+kre3p/wu0bQyEFTY+oKMf8Dyzy
	/vIQ9Fxl8lFE3VoKSWq7KE5GO3oGe544uUvpG8XypEq+mtIngpJ6zok6VVcP9xkakAofazaJsaw
	NHVk8cNhbHVCt8kOrFbPV9Gx2KYQ7UMbk8SlpkX3EbWZSptl/wvUimtYla8clV9iojW14B2f1Kv
	RgkWNDd/VOQ4IOzg6mRHJmj1AVKVvf3DT4jWFQAN9aOZRFY7DJdWgdTQ9lUmUdj5wPlxBdzinV/
	n1J+VG4Fpha4qDpAX9mzNwwJItnLyt263GJZjh8Zx4RzGd1nGtmzCgtPbhxxaR
X-Google-Smtp-Source: AGHT+IGCfw8MnaZdGqvEEvHd+FSaxxIcVRVcgx7we2FvoBfqTlwjQ/8CNYZ6iiunJkhF/2xh9UP0GQ==
X-Received: by 2002:a17:907:97c3:b0:b72:a899:169f with SMTP id a640c23a62f3a-b7367828ab8mr2215019766b.4.1763493765454;
        Tue, 18 Nov 2025 11:22:45 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12d55sm1413794766b.33.2025.11.18.11.22.44
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 11:22:44 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b735e278fa1so888750966b.0
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 11:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWm7H/b9VU9hJ8pHxvWY61cUsvFlQEVE1wQLT9+q+oihInUXCb7LADyCYHK4XKJB1Qn2jmP6bN1@lists.linux.dev
X-Received: by 2002:a17:907:7f08:b0:b73:9a71:13bb with SMTP id
 a640c23a62f3a-b739a711bbfmr1105968666b.32.1763493763746; Tue, 18 Nov 2025
 11:22:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org> <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <20251118141720.11c8d4d6@gandalf.local.home>
In-Reply-To: <20251118141720.11c8d4d6@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 11:22:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com>
X-Gm-Features: AWmQ_bmsWPgGv9cNVjLyQ0s9ppWaVS135_rInJWtZnsNiDd5zgRakkeyeIBUpm8
Message-ID: <CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 11:16, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I've been doing the above, and was even going to recommend it to James. But
> if it is preferred to declare the __free() variables where they are
> allocated, I'd be much happier.

I'm not going to make some hard rule that "it's preferred", but I
think it's simpler and clearer, and I would not want to discourage it.

That said, I *do* want to discourage the rash of mindless conversions.
I do think th is is a situation where people should pick the more
readable version when writing code, *not* a "let's convert existing
code that isn't being otherwise modified" situation.

And your example of

>        struct foo *var __free(kfree) = NULL;
>
>        if (ret < 0)
>                return -ERROR;
>
>        [ several more error exits ]
>
>        var = kmalloc(..);

is exactly where I do think that just moving the declaration down does
actually make code sufficiently better that it then outweighs the "now
you have the variable declarations in random places".

Because I really feel like the whole "__free(kfree) = NULL" thing
doesn't make sense on its own. It really only makes sense when paired
with the "kmalloc()". And _that_ is why they go together.

But again: I don't want to make this some kind of hard rule, and I
think it should be done judiciously and with taste, not some kind of
crazy conversion thing.

              Linus

