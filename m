Return-Path: <ksummit+bounces-1799-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D5A3FF77
	for <lists@lfdr.de>; Fri, 21 Feb 2025 20:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608C13A3D10
	for <lists@lfdr.de>; Fri, 21 Feb 2025 19:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4832D2528E5;
	Fri, 21 Feb 2025 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fvshzesT"
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836E1F3FE2
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165169; cv=none; b=jOZgjFoPcvrLVb/CYxWVV2E2bBSPF/6cVfgWoDeIY8wyeIuqMQdrBnSbKLxAQ1EK4urWJnGm6NUUW7QVws16aomLWLsqUayUJieX+zcL1FBnXXX8tfNgcUb9sR40oRQ1/lMguM0aJQuQANYDl+Icr+IyxKL/bpOkJxY8FImNvA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165169; c=relaxed/simple;
	bh=ycAq18Hl2Osak2ytc9YhbxBtTZWY1af4b1+0AgXoSAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEhPQ2G2j8zxZifKrlye5TjQi/oQNGiNscnhEL7ppTKoMiqToKc1nu8xUMyJLJV8pqxcItqCdy1e0cZIv7NrvSzZHbHs2y3sUwMjqf10IWbQnoTJir93TpUQ8XYTWb7t7SYh73hEiHkf0rgOliKDlrSgjXa1EjTLEFTVLycTGHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fvshzesT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab744d5e567so430119266b.1
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 11:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740165165; x=1740769965; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpPO+UoqYur20fhUIihwHOS5iBey4AF8c1A/KbY6wDQ=;
        b=fvshzesTXYrRuiJD3AhVYWcIlw1pUuSkO/j91a63Tze54oo/jTMMXTlJz4v1LQer9v
         XH8j2Dz/Pch3jgsheKsoeDffrPudFamoLa+WgV+kI5kKa5/43J7oVsbmLw6p0WR8L/Ra
         Hyrqs1MutBzShjQFPTMchnkpwO4OHkQ0lO9LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165165; x=1740769965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpPO+UoqYur20fhUIihwHOS5iBey4AF8c1A/KbY6wDQ=;
        b=nuypWCs9W1aFfYw2BGgs6/7/sqlFqDOlm9beihJAK2qBo10OoWnnpudkwnxLLxjwJQ
         cCzrURLQDSEG4bHonpTC4KFf3gaxGDOwtirtJEqtUhk7DMYIh5OaeE3Ys/tSNpXn6INM
         lt1vZwaL/8OXeKBTTIXSg2YThay/bKQXKWIj5C6q5coYguN9gDTRd1xQO5Mn0XM47twZ
         9z6NnBcL1SN5N6jlw95j8IKr3g0RbvS4eKlYAj/tcbSIsJJ4r8CwwouJGEEi0R0VHoRT
         Uwc6pVvFPeLw7Dyc4dEahQmRyZ1dJ0kvt7lxNC0J+xN3UAdMUzQflfD4v5AJYKwgCD+q
         24aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqwq97pA2hS41cZRACIyzuvEvhllW8pY7oUUOgTAjDPuZHNvr/0AaYvSjDPKh1NKEVL5AH/9vq@lists.linux.dev
X-Gm-Message-State: AOJu0YyXMQ+6lfbBSbroErHRcxOC7EKm6blKSmS42JgVu707hhS7pFkH
	i4apMrknse18XrBHt/hhWEcGxN80Uxn35q0LuATUqsBNz3cvhfk9kyPHuzrrwGyG7zQ/XRkX03c
	VpCo=
X-Gm-Gg: ASbGncuQ1gJaqWFloioDXArjIrXY2NXDEcsCobdlJzd0Dr6DYV0O6hHdR/F2hgrpYrk
	2gOo8x2Z0OSfdBtbpCf1b1Za7AZVSn41grX1xxzeDGV2+jLpfS0QY4Lh+MOBU0+NM3HwrGo7eri
	XoDBFO5ecN6BCGLUIhIPK/f6AYdiQJErnJ2mFjuEu+FmB2kzKXZWTtFyniUxigQ0HgnFjJak4H2
	XUxX0idS3eKjnFrj5MbBC7P4os2Tvs3l44QVhvsw6YI8QK9h8Fci5kMSVN7iUrp0sDWUQT72WLL
	IkbxdQfbD5IRJd6v8CiAE0VSF1res9ILbQ+oth90y6Uatun7OSa7bCqV2B9A7bD0YtPXwERezzk
	G
X-Google-Smtp-Source: AGHT+IGoPTCDq6d8RRuYtEFMK4LNsE5ZKgT+RBzcC43HYYhj8bydN+FJdv5O1dfo8HzvlJWHB0BCzg==
X-Received: by 2002:a17:907:c48f:b0:ab6:f0d3:9687 with SMTP id a640c23a62f3a-abc0b038c4dmr398638266b.21.1740165165482;
        Fri, 21 Feb 2025 11:12:45 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53281cfcsm1697418066b.79.2025.02.21.11.12.44
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:12:44 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab771575040so619486566b.1
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 11:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzt3gi/FwppCOGW13hGR0pD/y9ujTHd7Wc0ffZJJKUveMc24nqWpu+Oi1sOPlU1RTf1CFxwHrM@lists.linux.dev
X-Received: by 2002:a17:907:97d0:b0:abb:ec29:d40f with SMTP id
 a640c23a62f3a-abc0ae8ac7bmr518893266b.13.1740165164023; Fri, 21 Feb 2025
 11:12:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh> <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr> <20250221183437.1e2b5b94@pumpkin>
In-Reply-To: <20250221183437.1e2b5b94@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 11:12:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
X-Gm-Features: AWEUYZmM9QfL00hwgEM8sBRcCKHPzsXEZopO9LOxfzNGM8PLhnN7fh_mlPWpfF8
Message-ID: <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: David Laight <david.laight.linux@gmail.com>
Cc: Jan Engelhardt <ej@inai.de>, "H. Peter Anvin" <hpa@zytor.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 10:34, David Laight <david.laight.linux@gmail.com> wrote:
>
> As Linus said, most modern ABI pass short structures in one or two registers
> (or stack slots).
> But aggregate returns are always done by passing a hidden pointer argument.
>
> It is annoying that double-sized integers (u64 on 32bit and u128 on 64bit)
> are returned in a register pair - but similar sized structures have to be
> returned by value.

No, they really don't. At least not on x86 and arm64 with our ABI.
Two-register structures get returned in registers too.

Try something like this:

  struct a {
        unsigned long val1, val2;
  } function(void)
  { return (struct a) { 5, 100 }; }

and you'll see both gcc and clang generate

        movl $5, %eax
        movl $100, %edx
        retq

(and you'll similar code on other architectures).

But it really is just that the two-register case is special.
Immediately when it grows past that size then yes, it ends up being
returned through indirect memory.

               Linus

