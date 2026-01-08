Return-Path: <ksummit+bounces-2697-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 82325D00724
	for <lists@lfdr.de>; Thu, 08 Jan 2026 01:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25F5630039C1
	for <lists@lfdr.de>; Thu,  8 Jan 2026 00:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DA946B5;
	Thu,  8 Jan 2026 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QytYrfwD"
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258BD8F5B
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 00:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767830816; cv=none; b=PuH1Tf/NJXKjSMhZSeBiX1XZBraC48ICwLE9J26wbsiZMY2rFpOoTz2w9X4hSOXgBirP1BMQUiEED4dzD00vdJyEEur7oGg9MIZsR6Ovk170g7jmpW5TWy2YBMu5mIAn3p6/Ad4MJiYVw8kIkoig8f/ftpK/O14pfA3MUJVdvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767830816; c=relaxed/simple;
	bh=QtEAbfVtiKn5cj5XRGpsGTJDUKFjZEuBHGDKzvXXDjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEW5tJLO7e7AeHGZ+390kDPana2IHn3P9BFw38rRAuxi4bPQsqFeOs1cr4aifCqNKaxsPDav/lYJZNqRuegzm3ktOB/My6wYF5s/boD9UOxsTnsHrzdRtWEimRhTX/au1/FXdfjGUczQmhsS2diTC4uIw92B3/voJzxx8yLGL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QytYrfwD; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso5361607a12.1
        for <ksummit@lists.linux.dev>; Wed, 07 Jan 2026 16:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1767830813; x=1768435613; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=foSy0mHbq+bvIgetJxzEzdfsEyD2VC5LP6q78bup1rM=;
        b=QytYrfwDnXxVnFNafzMg2Es64QJeDfPWHp9+bvultBthMVmmXJ5lWld1okgEaARYDd
         +5UBKsXgHTR+CtkfHL/fGo/O3bcNfn/1LYYDk+9HW4ut4f8RVrRitKG0vz3b6XN9luLv
         o3KVXWrYSfFDpyQSR/IbjEBpE+2c2VnT0Lcxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767830813; x=1768435613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foSy0mHbq+bvIgetJxzEzdfsEyD2VC5LP6q78bup1rM=;
        b=lfVKnHRCpBpvuWhdAisuh0BcHMPf6uHc3ivbLSnX9D/AIcWWKOqDmoH8DRTJzNH0/l
         d7DvVelIIJsd96gOWem4Xo6YtF4grlw3c63VijYhWk38aht+aLs8FE43xSTxuh2BeKWE
         1t2o7iouhslar/ZnfsfHzF8TmVfNLSBzuHoDLzxh4HM+MyeoYgN6Cwwp7pVk0HNNXKOQ
         1X3eKI13+2cOUw1hcakjOI3JYVm4q4YPCsMSVRmLuyWNyGEjXmuSMl7lphMy1LyIFIFv
         NXLzk6/T+AL/s5CTkoszuq6G9b/GKTqGFbY67GzxVHxDQOp4qFBRQO0o8QwiOsxXIiGP
         w2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX27CpbU7BLSdi7PTzGpwKJc6QortCzsQtqPDbfmReqTL+Qqe6a0wnIFRv2/eqUCO1vapcEeS4n@lists.linux.dev
X-Gm-Message-State: AOJu0YzYxCGIxJotPZPln4uP9m/Y/ICYpZldlYjyCvnK8cjrqnXh3reU
	bfjovGxZ2Un8EdizsbtogrFIVy3XX5r/WsLhpzLZMJ/9qVTafoHTz0ezGPuUhSq8ubeeYyGW+nw
	yeVe4KitwpA==
X-Gm-Gg: AY/fxX76RpzU8MS/a7t3nX/IoFIv/OIuVG/i2c2aCpnECiTA+vdNZ0TITf+HsRsNdFT
	iiW1XyqYXXMxiGpZBvnxaVI8e+J7+lZYhOqR5Dv2um+rO5SPd8D8A4XOhP7sh0OITHqX/uTOPDO
	nIkBshGSP49OapmCkIALp5KkxIjV4Ik8uNAQ+qxBEgiAwnSnxOg+0B7UHY3l6zuBb1dblwJhd8v
	/H1iigUkx5yefj8alrPk9J50TgkTEPbSaNhQ5If88l5q1MTyxvWk+m3+Eb7Aj1l8lQYML0ZwVSp
	ugN0j8Og7uKYCx22eXVYXz9C/qNt/EXvEGv8YaQW4R2cEe5Ev3Ib5UD7T7VZjZJ81WhUv9EB4Tp
	HH31tKm3k2qzG7fsG28UJiZ0hm6mGRyTNVfdWHTlIb9DjR4G8IxOUUqRH1G0wPBaChKBb3fEPoY
	WAKE7qMBGr4jbX4gGj0NTvysoKtNrGNQm7V8jP5tQ+Ly7ZDKTcq1YFTjtdfRlPIhsavIVtlcE=
X-Google-Smtp-Source: AGHT+IFbk83ViDPsvJN2Kdzsq7su1r3/du8YBQg3dwA1SHdfUbwFw4AK6NgrHzPJ1/mTIAM8FBddqQ==
X-Received: by 2002:a17:906:308b:b0:b84:5818:6130 with SMTP id a640c23a62f3a-b8458186688mr123098466b.43.1767830813331;
        Wed, 07 Jan 2026 16:06:53 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c755sm651249066b.18.2026.01.07.16.06.51
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 16:06:51 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b83b72508f3so431019566b.2
        for <ksummit@lists.linux.dev>; Wed, 07 Jan 2026 16:06:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTLhj4j8zaOhH0JrT5J23j89S+sn5Vy4Xh8yajgLLl28Kd7nI6kgblrsiwJSJP18HINIZ6pm9A@lists.linux.dev
X-Received: by 2002:a17:907:9716:b0:b80:411f:aa50 with SMTP id
 a640c23a62f3a-b844538b340mr480612266b.48.1767830811282; Wed, 07 Jan 2026
 16:06:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
In-Reply-To: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Jan 2026 16:06:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg0sdh_OF8zgFD-f6o9yFRK=tDOXhB1JAxfs11W9bX--Q@mail.gmail.com>
X-Gm-Features: AQt7F2o7ADy4euEN0cDDHOeWG2qEVyCnup91Q83wkHbB-5SZ2fIILimORUfY0t0
Message-ID: <CAHk-=wg0sdh_OF8zgFD-f6o9yFRK=tDOXhB1JAxfs11W9bX--Q@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 13:20, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> Thinking LLMs are 'just another tool' is to say effectively that the kernel
> is immune from this. Which seems to me a silly position.

No. Your position is the silly one.

There is *zero* point in talking about AI slop. That's just plain stupid.

Why? Because the AI slop people aren't going to document their patches
as such. That's such an obvious truism that I don't understand why
anybody even brings up AI slop.

So stop this idiocy.

The documentation is for good actors, and pretending anything else is
pointless posturing.

As I said in private elsewhere, I do *not* want any kernel development
documentation to be some AI statement. We have enough people on both
sides of the "sky is falling" and "it's going to revolutionize
software engineering", I don't want some kernel development docs to
take either stance.

It's why I strongly want this to be that "just a tool" statement.

And the AI slop issue is *NOT* going to be solved with documentation,
and anybody who thinks it is either just naive, or wants to "make a
statement".

Neither of which is a good reason for documentation.

             Linus

