Return-Path: <ksummit+bounces-1984-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F97A4821A
	for <lists@lfdr.de>; Thu, 27 Feb 2025 15:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83BA519C614F
	for <lists@lfdr.de>; Thu, 27 Feb 2025 14:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AAF23C8B7;
	Thu, 27 Feb 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSVKHhqu"
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2260A23BD0F
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667424; cv=none; b=hC3eGCLSu2NHG7O5putBUCIPj0Duih7jVkKCGCM4Pj49AOuYEwi4Y8TEP26n8rwzdDyDfoTD9OYUqfobNAvLLzYeiSYWFYIiQRvwj8csrXIBmVm0zGr3HWfwTrSamnE+ORCQ0+01R5CA/BTjaf/ZUOkhB7Q+my9G1QViH+QO2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667424; c=relaxed/simple;
	bh=aHu4HjOiSkCHENsBL2+QjxQh/gEG6TIfQWWRKvIwFs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCeMP4Ndhf6rErNRPA7SIl+jIrifUt2dqhUlfpa2a7NTJ3xHH3piemoKlkgrJlNhXeS8yZOz03uevzzHrlfLtx0yBMp4NBmtTiBGhZzVSqz/qSRJ5Hh64rP20Zk3UrOF5MNJfhvtMVSoVDEae0bWQLXi8T4HjRHCzcVrk0EvgyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSVKHhqu; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30795988ebeso11300771fa.3
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740667420; x=1741272220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrQwoCf+jFDDz9zpktNsyPQTVzoYZj2045oO4CtLIj8=;
        b=HSVKHhquMwuc/fzVvaeYpTQp1Cbdxe57rFNpqjGTF98r0XcB/F6LaQq3JWw5EE4sdU
         IuFzD8/U35STsymvs/ka6JNSv8Gcw1/jG8QZ9Yz5gilzzkIpVa5erShUXQmNqqBS03al
         GtNKr/A7WBeOfCQPLolECKGhXJ8I6Q5dMEhhr6lUq4w4F4FX39gRHulsPfK0b5StQH/e
         6jTV8mZo0xW58k/G5L3Zlgnli6PXrPZBxZLlNtOamC68irH608VFdfO2V3f7KOJpGZn/
         +2oaDrtFCqI6tCRDXIHA6CpkSoiZc6z3XVzMPVQ6B0a7q5HxJ9TxD4B2ag0rf0kW+28w
         DbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667420; x=1741272220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrQwoCf+jFDDz9zpktNsyPQTVzoYZj2045oO4CtLIj8=;
        b=tfBxszcAPWQPwAtzsdbb0NooO1JJ98+32dDZ0JTJkK4/dWkCO052MGGqHnvcXNYWCF
         6vyqqZXPu63pMmjuv2XMAGQH+3FW1Njc3m+NjQYrHocslouT+PC4BFF3/9iOIM107cge
         AqiRYgnO/vzk8iQjUKdx+UvxXgzSsWCv0Wr76v91NKeh9n2hzjXggdqVteL+MFFMfnrm
         e1fq1c0Ao1K6cESIalPU2gJCXItKCLqRYn+KfnCG0UOkzvl4tiCJ+xDNhml80cLsDFbn
         TomKMKfV2EZqR8Q6SbNrGJond1MkzmCCUHB5sZ/XIpeUmiTO16t0nZeuNaDt1Zlnj0ye
         Ea5w==
X-Forwarded-Encrypted: i=1; AJvYcCUutjm4PVefLEznJnTiqoXEaLBZMRNq/4NtIhbebXhDwhhGdxPD4zsyTPL+0WEXtXMB/+8ONaKV@lists.linux.dev
X-Gm-Message-State: AOJu0YzybMePIk1INv6twqmbAdbYF8asZjrjQREdrmmfATW7aFzkNzV0
	7TsGrX2aQvwPS8gYOvii4PPeH0j97XR7JiR2uDd9WVanrnZhDNowDQ/Md8jKcGeSC1bXqWww7O7
	fYo9OqWwj/NiAoyFYcgBnnLReFow=
X-Gm-Gg: ASbGnctJcYNF/Ud0n5lXj/Tf2CqG6oIG4bM3Sny+MeymyFvoGTIuq2BCkWKYknGhnZI
	TqrjrdU4dG7EckCqyHvkP1kA+53317Mk5jGY9/CRpeMj9Qxfg9E7Jx6rJWp2P21oScn31AqKeit
	c9EhvXnNoY
X-Google-Smtp-Source: AGHT+IF2Ebq3Rent6Q8OTUwnDBzprobGcIoozGi87gZLcCKHId58DPsiZpKYoPLqcZfKxFk37rWwDUs2Lz+w9QpOQNE=
X-Received: by 2002:a05:6512:128b:b0:545:ea9:1a24 with SMTP id
 2adb3069b0e04-548510cf634mr6927671e87.14.1740667419952; Thu, 27 Feb 2025
 06:43:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
 <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
 <4l6xl5vnpulcvssfestsgrzoazoveopzupb32z5bv6mk23gazo@qn63k7rgsckv>
 <CAHk-=wgMnSOnaddFzfAFwjT-dGO9yeSkv6Lt21LgWmCKYCM7cg@mail.gmail.com>
 <hofm7mo46jzkevpr6fkqe2jnl3zrp5uxdux457hli3ywkneaij@yhhibsnuqfny> <20250226115744.024184b5.gary@garyguo.net>
In-Reply-To: <20250226115744.024184b5.gary@garyguo.net>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 27 Feb 2025 07:43:24 -0700
X-Gm-Features: AQ5f1Jqo_qhQ28y7ZKcJDKeDW7koaI5WfLn4CpiSw-oP4Tmva7WXiWcKvkc-wDM
Message-ID: <CAFJgqgTD-N=Gd7TRBD7N-5vuojq8nWffn-J91egoUP1stTFkhQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Gary Guo <gary@garyguo.net>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:33=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
>
> If you translate some random C code to all-unsafe Rust I think there's
> a good chance that it's (pedantically) undefined C code but well
> defined Rust code!

I do not believe that this holds all that often. If you look at the bug
reports for one C to Rust transpiler,

    https://github.com/immunant/c2rust/issues

some of them have basic C code. A major issue is that C, especially
when "strict aliasing" is turned off through a compiler option,
often in code have aliasing, while unsafe Rust does not protect
against all aliasing and have stricter requirements in some
ways. So it can often be the case that the original C code has
no UB, but the transpiled unsafe Rust version has UB.

The blog posts.

    https://lucumr.pocoo.org/2022/1/30/unsafe-rust/
    https://chadaustin.me/2024/10/intrusive-linked-list-in-rust/

also touch on this.

Best, VJ.

