Return-Path: <ksummit+bounces-1632-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C79AD4A6
	for <lists@lfdr.de>; Wed, 23 Oct 2024 21:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D532283171
	for <lists@lfdr.de>; Wed, 23 Oct 2024 19:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D6D1DB344;
	Wed, 23 Oct 2024 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EAVwGvIV"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E41D90A5
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711469; cv=none; b=pkThXayYFk6HaR+ESnIfsC11O5j82mdSFdUdiLkmvnqnCv7rX9IcmxU8mu5JnIXMe7K3aMk8dUTz8pS1Bq1IjulGhvhexeOjdC7CX/3le1awOgLD1DxvqW5Ch3qb78l0/6S6G3WtSlyd0r7F09feM5mv8cV9KJ0dAtj/VPYF24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711469; c=relaxed/simple;
	bh=SEURKXC67CG/xeyRenvYrrgBTAb8w7etVKRliIV62vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Evt+NAZ5VN8F4FJWcCHanzAoHh1hI/8QkiGejaNGZTh2qOYT94lV0aGd3cIIwFjyAFAfASz+eU5jy5YR0ztKjU7DvgEGp68MSTOXqVOwPQJzilTCguMQsZtTmw52RBWQpKk9cH+VV2Tp/0PiNbA74oG0Z+BAVBdGk92ae1AqKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EAVwGvIV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso145866a12.3
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 12:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711464; x=1730316264; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+e7T1vu9FNJZObzFlgyQWSw3AUTNv1bbvqIfeY1LjA=;
        b=EAVwGvIVYEIYM8wxSJ74IKFf1Lftb6MDJZhCConAvI8pVTqJZ9bgthkKCxNm3rIfqg
         LmUNiaqrHmocrQv42kXWlMXb6W7f9CtCJ8hAKRmd1Os79Uf+IfzDHNfPlWuBHDGVncdP
         c1pyrGVtNUTnl5YAbZvNCiA9U7aK+wuZ2CIII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711464; x=1730316264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+e7T1vu9FNJZObzFlgyQWSw3AUTNv1bbvqIfeY1LjA=;
        b=w19LtdyUkceU6LEkCI04zUzFVJlwSMUAWXLIBxGvaHSkBQUDP/loqDNzETnH9NqicP
         1NpncUu4fzYsTDYPyaSX0O8SMcFhoz70nFfRTD6Cd151LsVencfwgHqUql9PGCCZRHXB
         f2IYVblOUSzNstE0I4Diual8TYYO8h465DOkWJzGUClREnEgxKZDS0Kzkc96h6/SXIns
         NKhSb39Gw+oo3Exhmg4XkJaUnVIyej+ziaAAqKtcJPTpqt133FtwE7BrAwlsveKD2EDb
         OmoARTkNwRXOf3JyFDhluc09ENzaIheJIVSSVP0KfMi7e+pu3aguBn2Z12GL6yZmvKIH
         jP+A==
X-Forwarded-Encrypted: i=1; AJvYcCVTQriXNURLma23BEEkvGS2zvGWMdA8GLeuVlVxJYeDM6bTB1tkA4qmyjeIkR5ghKUkDGJ6O07Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwfYofr0kihtArXYcgXItN+9vKPaU3TaKPCjLq+jPRUiQ+nwu/Q
	U9nrw5mqKloggJOD2N55SpmmI18TRXPZZXDr2na8yOpp2lyZVUjQml70S8H2Yw6Nc3oDKikt6+Y
	VnMvgsg==
X-Google-Smtp-Source: AGHT+IGMgjsEpV8PWScArpS9ErZ9uoS3DLu9D4YmL6oGWRHwvz7u47GFk5gYb+y3FzjbkGEEUmDwhg==
X-Received: by 2002:a05:6402:2748:b0:5be:f3ae:b9ce with SMTP id 4fb4d7f45d1cf-5cb8af6bbe4mr3138450a12.27.1729711463912;
        Wed, 23 Oct 2024 12:24:23 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a653f5sm4799929a12.26.2024.10.23.12.24.21
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:24:22 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9932aa108cso9034566b.2
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 12:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+q3CoWgPAAGSVr6Xu+10ncQlBFxUOaDojjkQ7g+xSeKMmJOFcb4jV7P+QVp/72Jrp8EaUge4u@lists.linux.dev
X-Received: by 2002:a17:906:f588:b0:a99:e831:1b52 with SMTP id
 a640c23a62f3a-a9abf96ce31mr356698866b.51.1729711461550; Wed, 23 Oct 2024
 12:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <ZxdyYjzxSktk34Zz@sashalap>
 <ZxiOjBRdO6EMAY4H@infradead.org> <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
 <CAHk-=wj4aSJsVA6weV7u9KD1yA74JZq3dYZKbUtxp=3o_esnVA@mail.gmail.com> <e4ac4459-faf6-48df-851a-a5204bdee4cd@paulmck-laptop>
In-Reply-To: <e4ac4459-faf6-48df-851a-a5204bdee4cd@paulmck-laptop>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:24:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjT3EzfL3b37k1aNMPkmdyfaqNoxKiqsJz0rrOqnfky2w@mail.gmail.com>
Message-ID: <CAHk-=wjT3EzfL3b37k1aNMPkmdyfaqNoxKiqsJz0rrOqnfky2w@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: paulmck@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>, Sasha Levin <sashal@kernel.org>, Kees Cook <kees@kernel.org>, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 11:37, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Functional testing?

Yes. Things like the stuff that Guenter does every -rc, and that
invariably finds several issues every single merge window.

Like actually booting up the kernel on multiple different odd
architectures. But also much more complex things than just running a
torture test for a very small piece of the kernel.

The same way linux-next does the build testing on many different
architectures, and that often finds things that developers missed
simply because the bulk of developers are still purely on x86-64.

              Linus

