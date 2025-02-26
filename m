Return-Path: <ksummit+bounces-1917-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99098A46155
	for <lists@lfdr.de>; Wed, 26 Feb 2025 14:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2364516B112
	for <lists@lfdr.de>; Wed, 26 Feb 2025 13:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6265220688;
	Wed, 26 Feb 2025 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kylZX0RW"
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD221930F
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578021; cv=none; b=r30elRYgtBr/8d4jmqv9BvfgRocnYYrgojshe7NmRR5qU9azOSoV/5QSlaT9ULHzsplLCQOt44KYY75gKRzrhyMuJ+MlT6sp+OUcekPpUkOe6BX6cLg0OHx/9qYa8qtb5FveQuad2hyAX6ZQOhgsaW6yZqfTKM5q46C+qEgrVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578021; c=relaxed/simple;
	bh=Uh6z8rQNgbDVnnMLgo/z3Q5x11Klh8iEccl7RxrJ8yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T80PYMHvvGa+JlpcA5EcvhKgdgDQKu/GzRuK5t5umAFdQT7A1gjQ51kSEVUhijswCcOH5uERocXNmcPDhIwo/Qm5jTl/8aLV57KBn/paWDbdrqTxGOOXwtXtjF2nfxNOddS5wVUH8sJlM26JCFr5KzZPzc7nyyc9/7B6XQpVn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kylZX0RW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fc8482c62dso1767846a91.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 05:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740578019; x=1741182819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh6z8rQNgbDVnnMLgo/z3Q5x11Klh8iEccl7RxrJ8yA=;
        b=kylZX0RWdt3MKSgFuNuVyTIBSrJZhQE2MN8qHQdX0JgY/uYGvaHfUoBnvfG1CCRSGD
         fsgLgIQFVC9RGEloe58ma3rNrhunL5ipdN1la4eQ1FqgqcchH9FW8sIZsWuSd9bwPXlY
         WXn6vJKpmhxWWLKY7qQe4lPTcq3PkuHi+7zw2irgkFPg+pqDSTlroKjUqJ6tNfCY1utj
         7IdnXFysfAtfEQbIHtACUa6OLXVcJro/go9B2150+HFHTO1DpESux65jd0J2BM4tc1HE
         L/ifQostzIjTjuHcHXjqK1iF7xvFvQUspHaWvRMe2DU6/9b11zfRn5a+r2PvgOYixIbH
         ra5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578019; x=1741182819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh6z8rQNgbDVnnMLgo/z3Q5x11Klh8iEccl7RxrJ8yA=;
        b=AoVbgBXnKdNhJAixMd671vkV1H5KU/DgjVhOdwGcsTeE1w0gDXDfcna47sCRxq1idh
         oquZEtvnOdNWVGULBtIGv7D8OIGCE1j1/rEtS8SCsUVT3ALOavyaZxCvfANpbfwZB8mF
         7XHVEFExE/2v2rlhmTm/rHQRdOktwXqefb1D0MoydbXcuPHxUEs1f3WCPlcTmz/gclWV
         wTrsLxLqqlrhCrOzfK1wCSGXX0Ykh3A1Ig0GnwxaodITgihprXjVITb0sUgmrac2LWGr
         MEnqs+we63/7Yb/n0IQt+BzqsWKZLFU2vWM/yG90p2ddAYpfo68qZJGieH6PD2p+fReS
         uv+g==
X-Forwarded-Encrypted: i=1; AJvYcCX4+HS6iAyQAHPGjAXUz9VnJNmAiJXBKX/k/WBIuV1aAnqVl1N2o3dfYuPqyg16lGppVR9k9tIq@lists.linux.dev
X-Gm-Message-State: AOJu0YzMCHENGEMrF1i8DHv/L6p56ObD7UJZ721Ied4qXk5vnU+H5NrF
	vWbVcsgZQtJktbgo8vq5oYy/76oaznebYAz1JFZ6OqzH+vO191691M2Z9iL60l9AHkC/f6tPaW7
	ECF+cVbPXwzgN2Q/B9z81MW70cZ0=
X-Gm-Gg: ASbGnctyYIYmj1QVDMlalBzhSpvTm/QmVrZNlDE2WZEH97aREfqPAAfwONCNChSBbNu
	NPjjbaQSrELo6zXAEzeuXw9xQsWqU3Gy/gl7v2fjWcjF621vylccE/Hr2olQv+c9gB3goyigoz9
	z7rlUMGhY=
X-Google-Smtp-Source: AGHT+IFc3vG+EM1f/rxnkv+OF/YygbsxYUceTo8OxTTlUPuCjNKj3oW/GAYpwubqK/Dn82eMPU67bI5AbXTauhqj7+g=
X-Received: by 2002:a17:90b:38c3:b0:2fb:f9de:9497 with SMTP id
 98e67ed59e1d1-2fce7b0946fmr14258276a91.5.1740578019277; Wed, 26 Feb 2025
 05:53:39 -0800 (PST)
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
 <5E3FEDC4-DBE3-45C7-A331-DAADD3E7EB42@zytor.com> <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
 <CAFJgqgS-SMMEE2FktuCUimdGkPWMV3HB2Eg38SiUDQK1U8=rNg@mail.gmail.com>
In-Reply-To: <CAFJgqgS-SMMEE2FktuCUimdGkPWMV3HB2Eg38SiUDQK1U8=rNg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Feb 2025 14:53:26 +0100
X-Gm-Features: AQ5f1JprDdbWkneGamDB4RKH0D53hDCpYV1WQY_4j8FMlfOIcHEje14fR44RDZc
Message-ID: <CANiq72mOp0q1xgAHod1Y_mX86OESzdDsgSghtQCwe6iksNt-sA@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>, 
	Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 2:03=E2=80=AFPM Ventura Jack <venturajack85@gmail.c=
om> wrote:
>
> One worry I do have, is that the aliasing rules being officially
> tied to LLVM instead of having its own separate specification,
> may make it harder for other compilers like gccrs to implement
> the same behavior for programs as rustc.

I don't think they are (or rather, will be) "officially tied to LLVM".

> Interestingly, some other features of Rust are defined through C++
> or implemented similar to C++.

Of course, Rust has inherited a lot of ideas from other languages.

It is also not uncommon for specifications to refer to others, e.g.
C++ refers to ~10 documents, including C; and C refers to some too.

> Exception/unwind safety may be another subject that increases
> the difficulty of writing unsafe Rust.

Note that Rust panics in the kernel do not unwind.

Cheers,
Miguel

