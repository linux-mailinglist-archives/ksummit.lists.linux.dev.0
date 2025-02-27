Return-Path: <ksummit+bounces-1974-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06397A46FCB
	for <lists@lfdr.de>; Thu, 27 Feb 2025 01:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B30E318889C0
	for <lists@lfdr.de>; Thu, 27 Feb 2025 00:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DA028EC;
	Thu, 27 Feb 2025 00:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OAOg7I0I"
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C61A48
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740614681; cv=none; b=Q7jX5BYQMg+YQynjsZti4d4NB8Vnwtv8M3nBWVRelllms31MCBOwImK8LiOvPvggnVr3BabVn3eiYHfTlTM27Ng7H7kbSF4Gu3D8EVgnjA0B8cJlCFrL3Q+Ve1EieV/1vb0tiaU9SDJn4VTz6ELWDk2wO2y96KgLvGxpXgZDh34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740614681; c=relaxed/simple;
	bh=ebhWn3IvQK84c2iP54rZ5HLxq8SDs5x2uyrN0khsg8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhSABfqg6Hl6NwraM0J8LzUjqE+sGbl/78B8HlenrI+UsH+fAQvyXqsdNjANIT+bCv4cm6AztWmzNLR1HKNOanC9TaRfIVP81EiNnuevANsExIN7sLPyETzmTG0RVcct/iFFveGMp1v6Eutetz//SeYhLC8rbXKFhImegJPU9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OAOg7I0I; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbac134a19so47277766b.0
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 16:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740614677; x=1741219477; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=btG8mYMCiICkMqPGz84Q01oKttOQmb9UxH7nIH/qm+k=;
        b=OAOg7I0IkesB3YJKzajYWSEdVxh39GBo3PLNRgZ5ALxBLXh8imNjkdEpkXwyeSw81C
         Pbz46xjlkwyLpWl9qOJa0XgyWRysffgubbB/nJouCAmzGfTNtLL0EeAp8KsvL/B/BKOo
         QtQj4TETFQ1ZmRz12g4Dx0ONHTFC1h7tbLGnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614677; x=1741219477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btG8mYMCiICkMqPGz84Q01oKttOQmb9UxH7nIH/qm+k=;
        b=QuqFcAkl/HtqiQXTUwhtF1DRioIwLLmPnbCDYKTSu6XWcil0pHkcwl70QEs+f1Dx2u
         qIbKV+XVVFInMmQddn0dG50+YEk5Qk+mwD77v0CBSgVkd/i5Z/4r1Ca0EBTVuF7ylOR6
         Yc+mOvZcPtCFpneH+0mgb35nukc2Nqo4rf2wpuKmcnMkQmL2huuSJ/OpZ+VBQs47+tKs
         Q7ZZOj89pDx+fNC5fR6oG3vFnjEv9bTpThLS9FbUCqzQ2UfXuhV9bGw/3uCUVntWfmg/
         XQul0eeWGBU5intmOjRna+qLaVqzKBCcW1xVcB3yO+bKQYg2ropnscHZynTIFfnEEYs7
         fvag==
X-Forwarded-Encrypted: i=1; AJvYcCUQfZPjkwaFRzzPAEe0u4F0K+C8wtfDsaj76ODW8pkqO3DYoCX2+AsjraHC8H0ZuTisiyYManwE@lists.linux.dev
X-Gm-Message-State: AOJu0YyW4pL8GNWIlL/ND8ThJ/osMpZx8nRu11Dh6+99DHQSoo13MMLV
	Sf6WNRCqwJZ8QsDs30CCvcr4aV5EvOAl+GmElgcwpPatHTK1PbGbTFUjxeRyMY7USJNszRRmeLZ
	5oNeIzQ==
X-Gm-Gg: ASbGnctomtZKe6q378gEDDR+J5y8z9e4hC4e45jvQU5fa03Rxz5p4OxLp/1RGO7SoSu
	aCh0NqFbJPUwoiKzh7XBW3hrQrh5CiQmz1u0kQa9EOo0ZaDToAhxJ6OCcJnxGKOsFflHLfSaXEu
	LJxwdNj/qkc9/ZrddYChBUbnIQs7sTU2m1S9J2s8Mp1r0SOdh4JLFhBAamJGMG9q4b4tXlsFrxB
	n0pQSZPtwkZRbUt8JmGWGTGiwPqlXNQWYC8lb8pQBnuYFY2p1Zt3yfrnwUCqP+zNUaQ82pLIyra
	13NnJkFCiY6qMnpJDCwqoK62O01DlZHgZ2XyeKbkbtWo8lSlKrWA5n6JcLGv4FZHDoj4tDNcrvl
	+
X-Google-Smtp-Source: AGHT+IEo1/tsdYZYp4MJNzBxXC+81UIgMgBXEfLpqvidmE1h5tDiA4T+0IKDoyuKLuHftz+Rm7NjOw==
X-Received: by 2002:a17:906:31d4:b0:abb:cbc8:81fa with SMTP id a640c23a62f3a-abed100fb2amr995347966b.42.1740614677305;
        Wed, 26 Feb 2025 16:04:37 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b98b5sm25347666b.3.2025.02.26.16.04.36
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 16:04:36 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb9709b5b5so52782766b.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 16:04:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrn+NanewXUPYSXwmRKRPb+AXxft0SkAOUYMdTKrQtoz9nGC6slQAFVLVv/eGfWWQ+t4J6Kziv@lists.linux.dev
X-Received: by 2002:a17:907:97cd:b0:abc:28a5:cbe2 with SMTP id
 a640c23a62f3a-abed10fa38dmr1141732466b.55.1740614675833; Wed, 26 Feb 2025
 16:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home> <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home> <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
 <20250226173534.44b42190@gandalf.local.home> <CAHk-=whvzK6ugXhCdrTfXnkFR+u_+sCtwz4aDODJ_h-RJ3kOKw@mail.gmail.com>
 <20250226182809.5027e483@gandalf.local.home>
In-Reply-To: <20250226182809.5027e483@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 16:04:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsAoXTR+7=SxHykUs3zYzjSkY8Up2MDpjJF_PK8yVYQg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr4t0-VhZe9fJeoxS_YfOncjbgQB41_Y7QaZ9cZa_P903tC8ltOlxJUG6E
Message-ID: <CAHk-=whsAoXTR+7=SxHykUs3zYzjSkY8Up2MDpjJF_PK8yVYQg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 15:27, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> My point is that the compiler is free to turn that into:
>
>         r = READ_ONCE(global);
>         if (r > 1000)
>                 goto out;
>         x = r;
>
> and not change the expected result.

Yes.

It is safe to *combine* reads - it's what the CPU will effectively do
anyway (modulo MMIO, which as mentioned is why volatile is so special
and so different).

It's just not safe to split them.

        Linus

