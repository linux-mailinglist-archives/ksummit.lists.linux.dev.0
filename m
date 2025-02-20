Return-Path: <ksummit+bounces-1742-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30912A3D390
	for <lists@lfdr.de>; Thu, 20 Feb 2025 09:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9DC73BA3CB
	for <lists@lfdr.de>; Thu, 20 Feb 2025 08:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E771EDA0D;
	Thu, 20 Feb 2025 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyuP1ZD2"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED31EC01C
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041082; cv=none; b=fwZb+AjZPwhZy2QzvkbNx5oGVLPr5rLP/r/3WBGykMevVo21+rVpMbXQCGKUp03C1J11g3ZRY8XnbRPUAT1ikCtBA7imGyOtt7RRSxIYjk+aGmUpc7WXzwAHvbao6l78PqiRI20o+72nyJl0939i1Hp3m/3X2iMq/BXG2UVaH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041082; c=relaxed/simple;
	bh=HJ1XECDgshy0YbD6yjuBXd5UXHQVou2y7AGLiVEqzXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1xYfZKgT0x35e7t4aDNkcefwFBFfLgII9VkrAhgWJBowQ0VlvbaLWnM/GQBGcLQev3lhUeXUO1jbxGN2vdBOgffRSJMMgoCyH98dNKZSyQKgKweDwMG2IwG/+MmfabKrtdx/03xWT3rMB8fXJoQFJO/auDQKC3ivshm8xKxqec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyuP1ZD2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so946474a12.3
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740041079; x=1740645879; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1DLM9VCekfySYxigQbv6wSfMUfeFAysoJQtS7Tibb7c=;
        b=FyuP1ZD2kZHCAskkpwL+bYyw0WVlNwCKhP0fM/Ryql62sG/IZ+NQ0PUbfqDiwWq3uz
         Jo60VIZoZzwsvkFqvWphnawdFNR/EzzoEJKEG/pK5IsPpZPWVAJXE35b/aB9CgfCP+Fb
         xboO8fvM91gtwu27kLY9zLDrCnz17jrcjCUHL63ZUsddBtioF3aDiHz4E/Lnr1q3GI7f
         jrafCFNjcJF89wC40Tc7Ajm1BiRTy5Yx4s9z4zGmMLtoGcgCe78t6ZMH7IFiHaOsneNO
         z4L2RGnvJ/mxQf/75FDiguDVMau6ky9qhDsh9XkFYqPQQ3LNz+XPcATs/h/cbqsZRNvz
         kbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041079; x=1740645879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DLM9VCekfySYxigQbv6wSfMUfeFAysoJQtS7Tibb7c=;
        b=eEcu02xfByQAzFgwKozwDqZQPj8sP6f+VsAltNc1TQyynyAN5wuXGhMPm1Sj8xKKg/
         NEcRvFIHEyqXL4CAlsY5RnGWUxd8SS+k0xMQ+bgwxKFonPMjVGahLoYa4Fou7BU3pkAB
         Jo1EKN/eKaBIx3BK11SQ1zSxsFmNknD6vyT5nntjnKvosluGPakQC7IFi4cYu9V5ybLj
         X6CjCB+H+nidHn925869Frmx+vdIurFPo1yvD7YeWgC6rfrUp/ut8CHojCjbb82AhUJH
         dwdguMeyWm2pH3zTlw20+WgmY/wmzA7a0DBVjd8detTFTUUtfrAJ6DA15JEKzK3Nm1eL
         Ueqw==
X-Forwarded-Encrypted: i=1; AJvYcCWYcDx+8RnJy9sJ0eNoQPGMT6kS2fUVRcUEVodeggagD+Z9tVmLObENv/SEYRpv9cw1fpvoEtLp@lists.linux.dev
X-Gm-Message-State: AOJu0YyAJX3FWYKgBzCl8Fikhw1BbHAXNveSH2u+F+uwtVbKUglNHsFy
	bE0HBIrDUrK3X2enHVDoovQkrAYOkPrh9BxEdM26B75XX0MdrzqiqNlY
X-Gm-Gg: ASbGncvDkPRyvJ5xBhd3NfVOJOCjvyIvM2AtY6RqY+ru65SuQMiHmS1FJ2yxdU+a1gV
	wvsUJ5zPdcDtHRHDwy9Wcy1j8U0BuhDT8wIVebHoJ3XrUdvsql3QYT6b07SffCw28LSUKfH+JiM
	61oAsyUtwU0iwbYkPmSuuMtwPDIiUdaY/RNW6hs6DWSswp5XaPAZxbJwYOnwIoAmGJzCxAuTpul
	QYuYGz9c4yhEauLyDnAxq86xVmFeUiP4m+GXu5ihcpZK7w2CbCd6XQ3Y8ZJVoYyinc5SeAd4aWE
	/SI+Lg==
X-Google-Smtp-Source: AGHT+IHkGOjFEoRaJEgxmDz/0pEkyx2wuvk3PlN0KnRZZ7gxXlC16HVyEqS3RgGwpnpudH9gdVbcQA==
X-Received: by 2002:a17:907:3f10:b0:ab7:d87f:6662 with SMTP id a640c23a62f3a-abbcd0b1265mr522929066b.52.1740041078195;
        Thu, 20 Feb 2025 00:44:38 -0800 (PST)
Received: from p183 ([178.172.146.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9553fbd0sm789621866b.84.2025.02.20.00.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:44:37 -0800 (PST)
Date: Thu, 20 Feb 2025 11:44:35 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <ad27a7b8-f21d-47e5-8a3a-131cc2fb1398@p183>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <202502191026.8B6FD47A1@keescook>
 <785A9F60-F687-41DE-A116-34E37F5B407A@zytor.com>
 <f77d549c-b776-4182-b170-571d1e5bb288@p183>
 <2025022007-angelfish-smite-a69d@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025022007-angelfish-smite-a69d@gregkh>

On Thu, Feb 20, 2025 at 07:53:28AM +0100, Greg KH wrote:
> On Thu, Feb 20, 2025 at 09:32:15AM +0300, Alexey Dobriyan wrote:
> > On Wed, Feb 19, 2025 at 11:33:56AM -0800, H. Peter Anvin wrote:
> > > b. Can we use existing mature tools, such as C++, to *immediately* improve the quality (not just memory safety!) of our 37-year-old, 35-million line code base and allow for further centralized improvements without the major lag required for compiler extensions to be requested and implemented in gcc (and clang) *and* dealing with the maturity issue?
> > 
> > We can't and for technical reasons:
> > 
> > * g++ requires C99 initializers to be in declaration order,
> >   even in cases where there is no reason to do so.
> > 
> > * g++ doesn't support __seg_gs at all:
> > 
> > 	$ echo -n -e 'int __seg_gs gs;' | g++ -xc++ - -S -o /dev/null
> > 	<stdin>:1:14: error: expected initializer before ‘gs’
> > 
> >   x86 added this to improve codegen quality so this would be step backwards.
> > 
> 
> And then there's my special addition to the kernel "struct class" :)

"struct class" is the trivialest of the problems.

> Anyway, no sane project should switch to C++ now, ESPECIALLY as many are
> starting to move away from it due to the known issues with complexity
> and safety in it's use.  Again, see all of the recent issues around the
> C++ standard committee recently AND the proposal from Google about
> Carbon, a way to evolve a C++ codebase into something else that is
> maintainable and better overall.  I recommend reading at least the
> introduction here:
> 	https://docs.carbon-lang.dev/
> for details, and there are many other summaries like this one that go
> into more:
> 	https://herecomesthemoon.net/2025/02/carbon-is-not-a-language/
> 
> In short, switching to C++ at this stage would be ignoring the lessons
> that many others have already learned already, and are working to
> resolve.  It would be a step backwards.

If it is not source compatible with C then it is not an option,
for the same reason Rust is not an option.

