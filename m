Return-Path: <ksummit+bounces-1982-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFEEA480E2
	for <lists@lfdr.de>; Thu, 27 Feb 2025 15:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3B537A28A2
	for <lists@lfdr.de>; Thu, 27 Feb 2025 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF8D233D8D;
	Thu, 27 Feb 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFFiCyI2"
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BB2309A8
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666105; cv=none; b=eCl4nLtrsMnH4yDE/5243RylMMxO3Ik/jlLdPReh06b07dbGvmiXpWpdfe81xuQw9UZjx/U6p3DOTzpvIBlJyShJ9Dp/mFLAWfSAaSO6CFBPd+NCyXIcfh0koS0dO9PiQctWg8ISjZJVyq44HfcZfxHVBhhciMuKaXHZZeKqh9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666105; c=relaxed/simple;
	bh=jDiKd5u/UNI0PpWyrmjqelJqvH1haIS0fYaKH/QWppw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZL/t2ZWCJNSfx+K3Yo52xPxXJbzntfW4dxOrNlfAMlar90TIYFq5wCmvMN/y3teDDSJaSaAsHPD21hUyQil8csQ3HuXCVQNI/qHAUpHO47ryCuNKAEspbQBFO23KIEiVGMJj1hviChcZq8VryG4A+hoNInCbnP2AZjHX6VUmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFFiCyI2; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307c13298eeso12716811fa.0
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740666101; x=1741270901; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDiKd5u/UNI0PpWyrmjqelJqvH1haIS0fYaKH/QWppw=;
        b=mFFiCyI28MeeMovcefPfPOUVFEqbQvYUVoz87sCwQG7vPF55XWCUSB5oZhmYD3mnqm
         NKrJCxaP4Qo23wCsqqnfKcI54vQKXoodKbXhkvYyAn4SlL6p7vJkov/KMqCRaZUOWhD3
         sMmndzJIrNmsiE+I2Uv4I7JgAlpIB0/hpUhjx3iFAt9V7g4rGAJSTqir5c5/JQTPFHbB
         R2Jz05fPjFZgfIojvorTO/E8/4Z3Mtwzv63V9iDBFMfUyfMPgzXgWcCQnlFXam17e6y4
         JhRG8mSQFUwyWp7e3HckyTeJdffYGOp4GE5+sfpWBenOe1RSuTQpTX/ECg3fvWpT/bqV
         op2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666101; x=1741270901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDiKd5u/UNI0PpWyrmjqelJqvH1haIS0fYaKH/QWppw=;
        b=UfzJy1mhn58ToWxw1OdYNaXuebypayeAYUjQpoA4UiYUZ4ZN/y94/B34tYqWjOjJLx
         NCq6AnB2MPj8srbwLlV6zXXiblLXzxy/v647RyuVBfEFLloi2KFHKKaMQzbmTc/k1cK7
         IuOujgQBEhTaxvvEo34IlfHgsRbr2WsHlRN1shxego0bxVQO8YppAhUWWTguok2sj55Z
         CfrtHl8mILR2zhsY9MF5SJAAoUWx7ria1DwbQI+o/euNPFAohePDCwjVYsLlI7ZBf58O
         x7N7mX43lNtySTFJ1HPmwinKsQrU+p9gek0hz3PSDYmu4WMuvsSFbGZlibif6XMqV4Rs
         W+zg==
X-Forwarded-Encrypted: i=1; AJvYcCVoIboqJ5dr33xXJSXXTaoR03jBQj+JgRwR3ZWW6qvJcYZs++GgoEu97gv6kznUv9mL/s2aahy2@lists.linux.dev
X-Gm-Message-State: AOJu0YxuFTRIgQ80shWnSk/SDjbvBAT0KM503XmigEOinQEhHbHATrp6
	2O3RIPhkgvTK5A/pQEDmHhoZjVVAo0uVN+xWmlR36quXF2Sm+Rn5Vdgm3ZGgMFsfho/XJMclPpo
	7UI0W5xDeIdwDlhI7dskRw97NUm+sEg==
X-Gm-Gg: ASbGnctK9aBnyjjoIveJupgJ3vxkm/O2ht3BQuDEBNcdGesJbrf4hJbU52mdGW/lFN3
	4l1wdlJcp6ojjosCMiZKQTKKbOAGuj72P5i+F6eKZBfjM6RPW2Qk5nO8+IyAs6JLBt+Ohd6Okly
	ILGEb3ag0s
X-Google-Smtp-Source: AGHT+IG8QcFnsM4lFejfj+y9wVmwF6dAuaeJdmE8EIPO23hcK5koKsJkkZMquT3UfIGMPD5V0moetP1n9GXZ3jY+Dv8=
X-Received: by 2002:a2e:ad0b:0:b0:309:2999:77d4 with SMTP id
 38308e7fff4ca-30b84650d3dmr18509101fa.6.1740666101136; Thu, 27 Feb 2025
 06:21:41 -0800 (PST)
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
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
In-Reply-To: <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 27 Feb 2025 07:21:24 -0700
X-Gm-Features: AQ5f1Jp4j22pclUqXy_NRJGy5SyMDK7pivJm3KtHZ3o9BTX4Sjg-8m5F9ik4fjs
Message-ID: <CAFJgqgSjRwOUkcC5v6wGcfQ-53oWyWW+wBg3PZ-w7vRweHekpw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Martin Uecker <uecker@tugraz.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:00=E2=80=AFPM Martin Uecker <uecker@tugraz.at> wr=
ote:
>
> I think C++ messed up a lot (including time-travel UB, uninitialized
> variables, aliasing ules and much more), but I do not see
> the problem here.

C++26 actually changes the rules of reading uninitialized
variables from being undefined behavior to being
"erroneous behavior", for the purpose of decreasing instances
that can cause UB. Though programmers can still opt-into
the old behavior with UB, on a case by case basis, for the
sake of performance.

Best, VJ.

