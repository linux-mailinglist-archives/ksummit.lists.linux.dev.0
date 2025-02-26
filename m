Return-Path: <ksummit+bounces-1943-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDABA46868
	for <lists@lfdr.de>; Wed, 26 Feb 2025 18:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A9F165CFC
	for <lists@lfdr.de>; Wed, 26 Feb 2025 17:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1271F22A1EC;
	Wed, 26 Feb 2025 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBVwMJlL"
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85E229B18
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592169; cv=none; b=fp9OcQH/D4r/6oHX0n1nEcDAVdM58d6r6uv8xvrNPt6JvFsHZEkdxV68xmwTVrpUwfrPusw86xKlyqDbpo/Zo26fPXkrOM+DQ9hzjorVlL4dWyw7UgAK3WQ6GzD9hP9qu4n1rvBV/I+S5N8qmy7c3xCcCRf1mD34igCAwK2mRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592169; c=relaxed/simple;
	bh=pf1Ym/LYuPGVWFiM/lTbZoBgNa4GshyrvXq8DdYjCZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBGqJbzkwEghFwOISXSu4zUHFEa5FEbsB5X55f+bfBT8Te8Qb5bc/y/YCIKS5K/O/cS01dqiwwmnpMIht8eRTO6erqgN47ywqG0zI/TPObj4eWDAw0BXiZ97AB0cyb8NX7lgA18GJ9PgCSPqSuabqE+o+LeeEPICzy+HPggw2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBVwMJlL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fe9fd5e7f8so27102a91.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 09:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740592167; x=1741196967; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0j14nTPHAtaZCMj0Cm4vQzM1gNJxu1aU5P8x9//E1lQ=;
        b=aBVwMJlLzO1uQixF+9iVUrzPKaxOeJXJ6MQKrEQhYWv9L3T7xCdOFXFI1WwwXwzD2D
         f14BHeN7iufzDjiu5W1ahYWhuniij+a+IqUAaD/jrDoWLbfa78lU/aqEMwEGq7X/G7Jd
         PmUz0Vwru6WeB81n/zpjg5EJjHrKe60DB33fqNLi2Y9wW83HiB74/ZLfnfwC2/kh8vtz
         VSg8BSwS3Y+yhYQADvnqTxWGoq9KzKOerfX93pPk1o+SfsHdCZJen+jGwnZBMDIi2sAI
         gK3iF7HEhKkhBQKwiEtBCSWD1P8cGaLNiK7PRL2YJyui/P+36dGzOLur8Uig5VeSbI79
         eBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592167; x=1741196967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0j14nTPHAtaZCMj0Cm4vQzM1gNJxu1aU5P8x9//E1lQ=;
        b=bsTl5OfnCnS0ypi8ysU6gunJmAeEgvlMFDA6ye9txXi+UQDuBayZDK7MFgIBO0EqTd
         1MpILPr6MaxZ93o7K3HVVGxPsoITcWPq+y3RsaSWayFQiYfchLcMwhk0mTSdhvOoL6jA
         K3Vvh47WV6He0zJ+/qIrOtxQIZp9i6PQgO9kJBQ4hEUi23f/lwTwBm8DZ31kDTHWsofm
         AMvnPc+bPuTwUpgqCInWyCGcMatLlmk425WOBmtIWrvYFu8fFaBUMJ/6aCYaDYWTrHP9
         wQUfeyJn01sPSaaTu3V9FfWh9fyTyWd7yvveCIN1f/he0sH7NDQIneFUogqawdk/HXB3
         2KIA==
X-Forwarded-Encrypted: i=1; AJvYcCWzqJC2FFVAKL/lBN0ZHRjPdtcMK49xf2cQk/gXTZ1skFh1u3yuZTfAITQ01o5Uimb4ByQ5SGpq@lists.linux.dev
X-Gm-Message-State: AOJu0YzJEJdUwciWCEmdYjIH05hxMUX+zoYTNSK5C9graCMir7l8HQI2
	8CE4Ep9DZPaH8NC2AZs/wcpqhm8hgv9ixl43YSYcw99ygpCX5wPphXbKuA+REew1NNMTmfvAK6F
	S2NnnDNL2tQN7w8Sbel7hvYdnwHg=
X-Gm-Gg: ASbGncsFBTs6nBGd49xNT4SHtp+Uyh/v/azym5qOZ9Y732eziEDnKirgFsEFuAJJWjM
	WlrkX9LqcqAcra20Ew6GHGudziNrdukrj2b0VM/Me6jDbt4a0dmYUTc3PPKYO2Syg8kHfq5Fn5v
	gvVytxBOA=
X-Google-Smtp-Source: AGHT+IFW6GDWlGGpqjVzew7MkW1wPR2FwG46MyiXnmowTmnlMztbQM15bxmK//Vd/Upz5e/qpaEJMEC2Of8ep15DZMc=
X-Received: by 2002:a17:90b:38c3:b0:2fb:f9de:9497 with SMTP id
 98e67ed59e1d1-2fce7b0946fmr14733330a91.5.1740592167400; Wed, 26 Feb 2025
 09:49:27 -0800 (PST)
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
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com>
 <CANiq72mA4Pbx1BeCZdg7Os3FtGkrwx6T8_+=+-=-o9+TOMv+EA@mail.gmail.com> <CAFJgqgSzqGKdeT88fJzrFOex7i-yvVte3NiQDdgXeWEFtnq=9A@mail.gmail.com>
In-Reply-To: <CAFJgqgSzqGKdeT88fJzrFOex7i-yvVte3NiQDdgXeWEFtnq=9A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Feb 2025 18:49:12 +0100
X-Gm-Features: AQ5f1JpctmKLQF0BCjDn8OovkDnRBgv6fuJL4nftVzeYKWrkU3F2aUL59QzVDxY
Message-ID: <CANiq72m8zKABR0dXtkB-UiF-GeP5J4nAGqoabdmR=CfPsJejzg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:21=E2=80=AFPM Ventura Jack <venturajack85@gmail.c=
om> wrote:
>
> I am not certain that I understand either you or Alice correctly.
> But Ralf Jung or others will probably help clarify matters.

When you said:

    "In a preprint paper, both stacked borrows and tree burrows
     are as far as I can tell described as having false positives."

I think that you mean to say that the new model allows/rejects
something that unsafe code out there wants/doesn't want to do. That is
fine and expected, although of course it would be great to have a
model that is simple, fits perfectly all the code out there and
optimizes well.

However, that is very different from what you say afterwards:

    "Are you sure that both stacked borrows and tree borrows are
     meant to be full models with no false positives and false negatives,"

Which I read as you thinking that the new model doesn't say whether a
given program has UB or not.

Thus I think you are using the phrase "false positives" to refer to
two different things.

> You are right that I should have written "currently tied", not "tied", an=
d
> I do hope and assume that the work with aliasing will result
> in some sorts of specifications.
>
> The language reference directly referring to LLVM's aliasing rules,
> and that the preprint paper also refers to LLVM, does indicate a tie-in,
> even if that tie-in is incidental and not desired. With more than one
> major compiler, such tie-ins are easier to avoid.

Ralf, who is pretty much the top authority on this as far as I
understand, already clarified this:

    "we absolutely do *not* want Rust to be tied to LLVM's aliasing rules"

The paper mentioning LLVM to explain something does not mean the model
is tied to LLVM.

And the Rust reference, which you quote, is not the Rust specification
-- not yet at least. From its introduction:

    "should not be taken as a specification for the Rust language"

When the Rust specification is finally published, if they still refer
to LLVM (in a normative way), then we could say it is tied, yes.

Cheers,
Miguel

