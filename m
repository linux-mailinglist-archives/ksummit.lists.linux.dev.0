Return-Path: <ksummit+bounces-1692-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF1A3B1B2
	for <lists@lfdr.de>; Wed, 19 Feb 2025 07:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CA51890D50
	for <lists@lfdr.de>; Wed, 19 Feb 2025 06:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E65E1BC9FB;
	Wed, 19 Feb 2025 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKNG/2ch"
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151691B6CFF
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739946928; cv=none; b=kdPNarj8hYUhJ/rwboHvMSiLiQm2QBXCnCAQhRYw74GcaLgWZT4RRagDtlAvy/iCYnt+oyKOgEDmadOrR4NxFAfCQ+Iti/ExFsMMHyz/y88aZ6AoyzKHl9xlewgi1EFo7vasfbpMrVaCEog0Og2utowlQZgsiVoKeOFieIfwz8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739946928; c=relaxed/simple;
	bh=7cszKDQt9XMv02a+ZwGltOu4Yj63M69diOpbFNtrAPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWHVWLK0I+pXTEMAhvImDWIWlGWEV47zYMKg0RXDCpbmCahMtt0vSHBAr8dbyBBm2RMKnwEhazvKSgwYwQnfsgQshh+Zgpk6PK/Gfh7q+wmtq3MiqSu1/YBSLYlVbxeENcDb3U1l9XU8GdLk1jiE6cftpflzgDDFgAYjTYhFox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKNG/2ch; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso956890566b.3
        for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 22:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739946925; x=1740551725; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57W5SvEFGc40K4otu3jc8MLgWskx5YF0tVueFcEL808=;
        b=KKNG/2ch7kzDYIvXBsDTF8TgAE92rrIJYZ+2rMktxmpTGM7EGKqLUFO/dgv+CvTJgp
         OmvXVtnrn4JAYPKZIXJ69M6IyRUqlZlqqWmyUgPdveGmhZ0nPG4FZWjeR8p9YM5NeNLU
         7856qLZ20tdyLIBd1woho7Seb8Ozl8k3vuuXzeTZjBfGnOCwEPwAuTiXYS8Qv7nTkCAT
         6k2qJzGawzYFn8uiRZD17rimzION0+MGcIcJme630LguZKqypTbXktXY7o1J9TVMCONl
         dAOsHa8ezJOEmMgcqKWI5vT8jHW21fN5CLSey/rVyH9agQjo/U6WDDVX9V/zFTupUtpP
         R1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739946925; x=1740551725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57W5SvEFGc40K4otu3jc8MLgWskx5YF0tVueFcEL808=;
        b=q/qReaX0vRbvLtFHJxGgYwPpPp2G1jzOnCuUZHSjTZVVKy1Z2uRhclvFby5DjGr6N9
         TwGtXyJitjvt18y7UVMRmB2nQnse0Ne+1lu732NEHRlAx42oSwJygtgnk550gZLVn7EQ
         71HD6R5kAtaxZsAQGqP1uiCEz/ktOwxj4/Nc1WhMu4lFOBe38AMB1EaPgx64s9OL5hKR
         2npLxFdSqmQ40rqrhU8x9bb/l+DgMmfJTodOzXUdwcX1+HStludO6sFDWR14z2PVnyTd
         SiSQEt1B8DqZ69lxl6t7gYLg1bY2qunEgbwsXkOl+ysFN+74AXQKTl3lqJnK5zuz65kH
         V6uA==
X-Forwarded-Encrypted: i=1; AJvYcCUCd3JeySsP7dEOFh4hYgzj7toZ/GfZhVuGyj8XjqhZ22WadPB+T9ukMCVv0FlNqb/iPFVW6pr5@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm+QFC6GupksptNfxR6pY5c94UmAtaJf4wt49zjlNFYEtP0aH/
	moLK7jJzn5DIWi8fu4U6/WUvANjyvMXUizJ46QWuydI4jNfTRwjvVUfJOuKuT6m5lKJ6g4b57Uu
	z+sfMqpsinYQjtuESZVc2yUNJa+A=
X-Gm-Gg: ASbGncuf8hACYF7qpH7WCEu0JwlyJw3FqFwk+TKQlZxZ+gYRH/sfVMcWfHfXQ9nxxVG
	wKZW8Hs+39VuAWLrn3+cnb3KwrUoojlcqQdyeoLDFTdkE7CIygyyuEt96uBD7EnZbW0OA9xg=
X-Google-Smtp-Source: AGHT+IHM8K/ufJhZwysVLMejsQ7FWat25JMEeR9lhuWlXykaokUltSn4JDH67VDt6SmdhK2xCiK9VCOQHkX9jfG6si8=
X-Received: by 2002:a17:906:370c:b0:abb:519e:d395 with SMTP id
 a640c23a62f3a-abb70a959d9mr1374646266b.20.1739946925026; Tue, 18 Feb 2025
 22:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <36783d51be7576fcdbf8facc3c94193d78240816.camel@kernel.org>
 <4cbd3baf81ca3ff5e8c967b16fc13673d84139e8.camel@kernel.org>
 <e63089e15c6f4d19e77d2920d576e0134d8b7aa7.camel@kernel.org>
 <Z7T5_WGX_VXBby9k@boqun-archlinux> <615ce44fa528ad7be28ba518e14a970f04481078.camel@kernel.org>
In-Reply-To: <615ce44fa528ad7be28ba518e14a970f04481078.camel@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Feb 2025 16:35:13 +1000
X-Gm-Features: AWEUYZk1tP58mZwBWrZ_OnI_ofVylDGmguJN0E4-Lra6JB37GljlIo3vIoHrYPs
Message-ID: <CAPM=9txBg1m=qp9=nHJXS1h2XB8TSL1tj6CF=Z802u=YX7hBDg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 16:20, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Tue, 2025-02-18 at 13:22 -0800, Boqun Feng wrote:
> > FWIW, usually Rust code has doc tests allowing you to run it with
> > kunit,
> > see:
> >
> >       https://docs.kernel.org/rust/testing.html
>
> I know this document and this was what I used to compile DMA patches.
> Then I ended up into "no test, no go" state :-)
>
> I put this is way. If that is enough, or perhaps combined with
> submitting-patches.rst, why this email thread exists?

There is users for the DMA stuff (now there should be some more
tests), the problem is posting the users involves all the precursor
patches for a bunch of other subsystems,

There's no nice way to get this all bootstrapped, two methods are:

a) posting complete series crossing subsystems, people get pissed off
and won't review because it's too much
b) posting series for review that don't have a full user in the
series, people get pissed off because of lack of users.

We are mostly moving forward with (b) initially, this gets rust folks
to give reviews and point out any badly thought out rust code, and
give others some ideas for what the code looks like and that it exists
so others don't reinvent the wheel.

Maybe we can add more rust tests to that particular patch series? but
this is the wrong thread to discuss it, so maybe ask on that thread
rather on this generic thread.

Dave.

