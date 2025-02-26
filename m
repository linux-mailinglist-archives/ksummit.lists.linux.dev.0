Return-Path: <ksummit+bounces-1950-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FDA46B1F
	for <lists@lfdr.de>; Wed, 26 Feb 2025 20:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC63B188BD1E
	for <lists@lfdr.de>; Wed, 26 Feb 2025 19:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8193242935;
	Wed, 26 Feb 2025 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JwXSONMM"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3836123A9AF
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598389; cv=none; b=WSiZY2L4k0rEgGkxfJrwYzDSPWMl10BworH14MLBUQUPVYRYeN81+ABkkOhft6w3pSahMuaEZn5WwCvIctaLNufkAq86vZk+n/gFvJgZ7Mp/a0tqkLvWRDO++KNcWv7l2YttrHk+Izx189YgG83AkFT7mekoMC7cP/dRFNeAgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598389; c=relaxed/simple;
	bh=3usIangzu6r4PaFTKvtnl+Iw5bp8L+06/4fSfDibBko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaD40wj1LiAqhvQDF+xqmXAIXUyUzGIgJ48mWwDiu88+Mm8GqDZq0y14M7jIIscSSn/qeX0hTdl1GPaKZZ+EwawH/ixNDFmIRL/KMKzgW8u8C/ubl0ad4aOjn/oMqUfRWJvU5Uzk/IZjgSLETYZZPJWkomxtgLHk49pkDmy4XGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JwXSONMM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so70201a12.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740598385; x=1741203185; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eF9pvpFw1/YLJE+EPUaheMire2o0sgR/Rpuz1tvLIh4=;
        b=JwXSONMMUWeEroiX/ZGPH+1NSYrpgHdZyowSMB3yr+M5Ij3M5b/42dl/9o1oYrkpYJ
         yBAvLB8aRI4KU7haVQMjCpAjN2KsfB7khuBa2lKjHUASTPz32NXKw26k411OxilyvwZl
         nP+7Z9D+0SaTBIE4SI6fqdTe9px6Ex7WHY0Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740598385; x=1741203185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF9pvpFw1/YLJE+EPUaheMire2o0sgR/Rpuz1tvLIh4=;
        b=i9v+rK6aKOhqxz0dlWElowoDJHAYbOrTjjRGJItMTaKDoAxRqzzdCZuvxnoHhuMzSK
         OjSpE0gC1Xbwno9X0wnbo71hVKdc2IwNVtletWa+7VhBZ3LPbyiPcXv0LYjXvh1z4VJd
         IX4QRUP8ggmyUN/kfqPQqYUlzPlFWsGhkwCkAiDmeA8KWU4YB0cL1swtbxoxtMQxjBJT
         h1czPq9iG31pJVUJ/5XMweQf1yPp/hTIu3iY/lS/0TW64t29FG1/Piyh92dgD9LTa2yt
         Yjar4D5BVK4HCtynGybXB9IkK7iXlAHLK0h8yimW5HljVV94Q8WTD2SjA8mUfaZCHghG
         ddgg==
X-Forwarded-Encrypted: i=1; AJvYcCXmyszyIHcEXAtROEIHPf9CwYN2ksVtkkX2htD8J/X3GfSlgt4ovc4XrT0P/Bbg0uLdnyekOnLW@lists.linux.dev
X-Gm-Message-State: AOJu0YyYYBh2GVyJCb+C5Yao/N4H9Cev5Qtfbn3HqTZtznu+y/+vOh1j
	4TWJvS+W6KJkYkDaX1wAZnriuQeuwvpqmm7+FajGIy84CdNiMbj+9tAU+36nH/nr/mV1GgCHUzD
	jCNjJcw==
X-Gm-Gg: ASbGnctm45xc4MtAKge7nlH7nCTyaD5NrWl6pm2vUHoHD3OrtKi2TJMh53GdR0mhyc6
	2MLV3a1KaJ6sI8+3jvyxNyqmVRbK6zA2QpKH3DBZwMyxJBHlzJw7MgNd9GXKJg2gW0cn04dKXda
	K2BpSne6p1jW27G1COA/ysWMNVUkrE0IN+s8HgH5+vbDKJrtoCGej6QIB02wZ9raHzjqQoYP4QS
	B/L1LOLk1kQsMESlSsUWkw5aNXc7/4MID7yDsIa1XW8TazNnpgTz3i9iXX1glmDUdo6RXkKRjoD
	dVa8WFnNA2vYIOcah7BcLGhwQvPxNbCadfGzJZfC1rFxzsH0GEjpzpie5S/IOkOi6NwL+LU1zeu
	R
X-Google-Smtp-Source: AGHT+IEVMzpFa1HHaXQoC1FaTInRDq8dVJe/2i3aNyMr0V8cLoQp6zkCzLkvRAd3A9bjv7Wp5S8Xcw==
X-Received: by 2002:a05:6402:4604:b0:5e0:7cc4:ec57 with SMTP id 4fb4d7f45d1cf-5e44bb37281mr17155677a12.31.1740598385123;
        Wed, 26 Feb 2025 11:33:05 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460d1bce8sm3312326a12.63.2025.02.26.11.33.03
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 11:33:04 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so70166a12.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 11:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI1XPHVWKa479VCqowiJ3GKFF7mJS0PF54oGqGIEfpoDUGxzepcGA6GWDFh8FZJ9AASk2+gU2s@lists.linux.dev
X-Received: by 2002:a05:6402:2690:b0:5de:a6a8:5ec6 with SMTP id
 4fb4d7f45d1cf-5e4455c2f52mr21228207a12.10.1740598383403; Wed, 26 Feb 2025
 11:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org> <CAHk-=wgLbz1Bm8QhmJ4dJGSmTuV5w_R0Gwvg5kHrYr4Ko9dUHQ@mail.gmail.com>
 <Z7hulnJ4fwslRILy@pollux> <20250223180330.GC15078@pendragon.ideasonboard.com>
 <CAHk-=wie_Winz7CtRCM62S2b1pWKN2Jt2wdGHgFBv=aBU8qwqg@mail.gmail.com> <20250226160554.GA33931@nvidia.com>
In-Reply-To: <20250226160554.GA33931@nvidia.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 11:32:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjg1PJ81E23DB1QbvPBQ04wCf7mJjRAXG2U1N3BkNTY6A@mail.gmail.com>
X-Gm-Features: AQ5f1JrQKblYd_mlL56qfeL7HjizeGfzBVaee_mjm-AjiG60v7JHCqrs21U3slM
Message-ID: <CAHk-=wjg1PJ81E23DB1QbvPBQ04wCf7mJjRAXG2U1N3BkNTY6A@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Danilo Krummrich <dakr@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 08:06, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
>  2) Does Linus accept a PR from the maintainer? This is what I think
>     Laurent is driving at. AFAIK Linus accepting a PR at least
>     requires it passes your build test and boots your test machine(s).

I don't think I can give any black-and-white answers.

I refuse pulls relatively seldom, but there are no hard-and-fast rules
for when it happens.

The most common situation is that something doesn't build for me, and
that's because my build testing is actually fairly limited.

My build testing is trying to be wide-ranging in the sense that yes, I
do an allmodconfig build on x86-64 (which is likely to be the config
that compiles the *most* code). And I do a more limited - but real -
"local config" build too fairly regularly.

But at the same time, my build testing is *very* limited in the
configuration sense, so if something fails to build for me, I think
it's a pretty big failure.

Now, 99% of the time, the failure is on the pull requesters side:
_almost_ always it's just that the stuff I was asked to pull was never
in linux-next to begin with, or it was in linux-next, problems were
reported, and the maintainer in question then ignored the problems for
some reason.

Very rarely does it turn out that it was all in linux-next, but I
happened to hit something nobody else did. Yes, it happened with the
Rust 'bindgen' thing. Once. Not enough to make it very much of a
pattern.

Sometimes I find problems not in the build, but in the running of the
code. That actually happens distressingly often, considering that my
test-cases tend to be fairly limited. So when I hit a "this doesn't
work for me", it clearly got very little real-life testing. Usually
it's something that no amount of automated testing bots would ever
find, because it's hardware-related and the test farms don't have or
don't test that side (typically it's GPU or wireless networking,
occasionally bluetooth that fails for me).

But that tends to be after I've done the pull and often pushed out, so
then it's too late.

Honestly, the most common reason for refusing pulls is just that
there's something in there that I fundamentally don't like. The
details will differ. Wildly.

                    Linus

