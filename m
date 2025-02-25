Return-Path: <ksummit+bounces-1890-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1ACA447F2
	for <lists@lfdr.de>; Tue, 25 Feb 2025 18:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3517819E32C3
	for <lists@lfdr.de>; Tue, 25 Feb 2025 17:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986EC19922F;
	Tue, 25 Feb 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax/vx+dg"
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E40155756
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504107; cv=none; b=pOwaXUVLtf8k3r15Rnjapqjfickzxq+Bf6LWlTertxJkJuHd15oYyZKZL64wXdeeBXN9weNKQ2mzU8EyIb+P3PAsiEegTnsL4RNhw6zFTTswF1AHAq+kbcMQiahPoyI8C7FVyLAnzxDEW/33gu9DPUHB6hB8Nzco39YFl6EGM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504107; c=relaxed/simple;
	bh=g8b94iQeKit7M6efwtxa16qoL3Q0/wQFaWwGXIVnAsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxBLT072XV+enFBdDXGVas/WdtAQNPTJB7So5DJzP41s2RfV8pwrwNJJask6//8JDpyxNenKAIswpldAr8U/Q2sDWGNcTS4xTLGwOFBrIqfiPuLxWCMylb78AYWS5Bm7dldqrS15i5PYB0KuxNv4Mj3zkJOmoSHtJuvvtmfdV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax/vx+dg; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-54838cd334cso4898191e87.1
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740504102; x=1741108902; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFp1PXg9ibzgWTyF7i/yFKZcS7KZ9Zv8rxtRiXS5hLs=;
        b=Ax/vx+dg2i09vUHKL+wLCR+cw46fZPNu+KBwV8ySKY4VRnY1mNCHbjHkzsrfB4Xfuk
         lEKWFbh7oXllKd8dI1xS5OiCinF3jDkw+f3QI7DC8z/TFPoZxbZwyXQc+qw4C7XgBX0L
         dbgcPBWlMP03rUhCk+LZg83klp7G12ftknmnzcr7V5ckJsA/gArfuONt7nriOaaSD/oY
         OFrwG4L7E2KKDvrn0zMhjIrOqIZK6cHOraj7kyXbV2FEkP4IYIjHMMKkfJWVBgsEOrc+
         yEcnzCdEtgyh6w9acV/M1214tamYCiycfLRvtByEliCn/VWKEVJvHzWfPa8GB/nl+0Zi
         3XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740504102; x=1741108902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFp1PXg9ibzgWTyF7i/yFKZcS7KZ9Zv8rxtRiXS5hLs=;
        b=ZnHOWj7Ua3CKdHooHcEdwsT9M6gV/F/WuwWKvw6fVn8KCSrL0RTtjP0VyiWiXi/Dgr
         ZsuIxa135oikXJVX8UdMAvrRtoeH4TVUOAkWMjsc+RJhqoQu86dN05yEWX3ujKLzFSpx
         SgfHEQq/vRn+JUEWquOyrPCpvps9nu0Otu4EybNePRXwm+WfYzvfOSKAH3Yo0Qf3daaD
         9ms1TOvAHUkiLaLDgdXqWpfMBimDGGFD2Zaelj8qjG1khYf7VaeTAigRNsxTFobFnt/K
         CSY6ltNLnhgQ3CdYyF7aAPQaWyPOA7jFqh0zsFAfQ/FcFMKLf8ZhceAKMZIPgPgvDOxE
         eaAg==
X-Forwarded-Encrypted: i=1; AJvYcCVOy2pMXdWa5F9yfMGDDzecDOKArg/SuZG7yeh7lkyND7Sh0TD4jmsdMY1P0F5OjU8r4lpRmRjy@lists.linux.dev
X-Gm-Message-State: AOJu0YwGSQkCxkaBJAp+W21yF84M71zXWNuR3Xg1gBitfJkVaJkr7PDn
	UjXSczw2GN+IaetYiyCsVS3vrvlT7ZVfQY22+N8yiq5oTStBLHGg4cDra1rh+FW2xvCo9r5c7P1
	OVNFOWf6b6xZme0UbBeSE7JxX9B4=
X-Gm-Gg: ASbGncvjl93CQLsNo67eTD3KWw9oKpP9Zl6MQ3n01+tkRvB9tb3av9kgAdBFr8Dpn8q
	0UycnZ33tCnzLqy5VQfvu3LjDudIHGj3yqvlz8A8Q5r2RN97E51+OFnU8PdHJPMVbY/iBXs00D9
	uIgw2iHC2n
X-Google-Smtp-Source: AGHT+IGg0L2G18ybzjJhT/nuNLljUfMebQR4U+Qx20CQIV2uJH1FVYMEDY2DEJ77A8Q/BgGVqabuhNZ/bsrJvAlDy/I=
X-Received: by 2002:a05:6512:39c5:b0:545:d70:1d0e with SMTP id
 2adb3069b0e04-5493c54ce34mr128422e87.3.1740504101982; Tue, 25 Feb 2025
 09:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com> <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
In-Reply-To: <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Tue, 25 Feb 2025 10:21:28 -0700
X-Gm-Features: AWEUYZkUwDT8aBSZwqWOVandZso4Q43TwCtZOPgm5JWe1L0EPqYxR9ThVnT5vic
Message-ID: <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Alice Ryhl <aliceryhl@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 9:12=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sun, Feb 23, 2025 at 4:30=E2=80=AFPM Ventura Jack <venturajack85@gmail=
.com> wrote:
> >
> > Just to be clear and avoid confusion, I would
> > like to clarify some aspects of aliasing.
> > In case that you do not already know about this,
> > I suspect that you may find it very valuable.
> >
> > I am not an expert at Rust, so for any Rust experts
> > out there, please feel free to point out any errors
> > or mistakes that I make in the following.
> >
> > The Rustonomicon is (as I gather) the semi-official
> > documentation site for unsafe Rust.
> >
> > Aliasing in C and Rust:
> >
> > C "strict aliasing":
> > - Is not a keyword.
> > - Based on "type compatibility".
> > - Is turned off by default in the kernel by using
> >     a compiler flag.
> >
> > C "restrict":
> > - Is a keyword, applied to pointers.
> > - Is opt-in to a kind of aliasing.
> > - Is seldom used in practice, since many find
> >     it difficult to use correctly and avoid
> >     undefined behavior.
> >
> > Rust aliasing:
> > - Is not a keyword.
> > - Applies to certain pointer kinds in Rust, namely
> >     Rust "references".
> >     Rust pointer kinds:
> >     https://doc.rust-lang.org/reference/types/pointer.html
> > - Aliasing in Rust is not opt-in or opt-out,
> >     it is always on.
> >     https://doc.rust-lang.org/nomicon/aliasing.html
> > - Rust has not defined its aliasing model.
> >     https://doc.rust-lang.org/nomicon/references.html
> >         "Unfortunately, Rust hasn't actually
> >         defined its aliasing model.
> >         While we wait for the Rust devs to specify
> >         the semantics of their language, let's use
> >         the next section to discuss what aliasing is
> >         in general, and why it matters."
> >     There is active experimental research on
> >     defining the aliasing model, including tree borrows
> >     and stacked borrows.
> > - The aliasing model not being defined makes
> >     it harder to reason about and work with
> >     unsafe Rust, and therefore harder to avoid
> >     undefined behavior/memory safety bugs.
>
> I think all of this worrying about Rust not having defined its
> aliasing model is way overblown. Ultimately, the status quo is that
> each unsafe operation that has to do with aliasing falls into one of
> three categories:
>
> * This is definitely allowed.
> * This is definitely UB.
> * We don't know whether we want to allow this yet.
>
> The full aliasing model that they want would eliminate the third
> category. But for practical purposes you just stay within the first
> subset and you will be happy.
>
> Alice

Is there a specification for aliasing that defines your first bullet
point, that people can read and use, as a kind of partial
specification? Or maybe a subset of your first bullet point, as a
conservative partial specification? I am guessing that stacked
borrows or tree borrows might be useful for such a purpose.
But I do not know whether either of stacked borrows or tree
borrows have only false positives, only false negatives, or both.

For Rust documentation, I have heard of the official
documentation websites at

    https://doc.rust-lang.org/book/
    https://doc.rust-lang.org/nomicon/

And various blogs, forums and research papers.

If there is no such conservative partial specification for
aliasing yet, I wonder if such a conservative partial
specification could be made with relative ease, especially if
it is very conservative, at least in its first draft. Though there
is currently no specification of the Rust language and just
one major compiler.

I know that Java defines an additional conservative reasoning
model for its memory model that is easier to reason about
than the full memory model, namely happens-before
relationship. That conservative reasoning model is taught in
official Java documentation and in books.

On the topic of difficulty, even if there was a full specification,
it might still be difficult to work with aliasing in unsafe Rust.
For C "restrict", I assume that "restrict" is fully specified, and
C developers still typically avoid "restrict". And for unsafe
Rust, the Rust community helpfully encourages people to
avoid unsafe Rust when possible due to its difficulty.

Best, VJ.

