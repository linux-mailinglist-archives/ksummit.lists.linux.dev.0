Return-Path: <ksummit+bounces-1999-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B403A488F2
	for <lists@lfdr.de>; Thu, 27 Feb 2025 20:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8378518877B9
	for <lists@lfdr.de>; Thu, 27 Feb 2025 19:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5EA26E968;
	Thu, 27 Feb 2025 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAkLoKYW"
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6026E950
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 19:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684336; cv=none; b=Xh+EHnuVrd93F/i/fyFkeTTD6563eNVWUfT7QqU0wCF7+D2uxex+Xx/v3kNzsbRGDpzQfMfOiw6f+NzxkhusHwDb3QZDAYj5jGJCBWm994KADGkJwF9vXJvsloPGXV+3Fhvp2o3yYdU29XJlIvZzjByrNkUwmkExirk241ZLHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684336; c=relaxed/simple;
	bh=I4osQ5RPj6E7bXAobrn2V0yGZ0kIauATo/Cf+WI8eCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciL1SMYOY2dyoRK5Hom0B8jyK888AwjsCPFgy3d7ngEHUEEXumVNSfxH/ftQALxMbQ9teSaRlr2bK0aPU/ojPW8pFn6Z6ANLXOHVac60M7bALcBx0pWYdLnfzrORJO9ECa4u3mCIOrRjSNHEQqZdLABkLH1lXtziOS10HbESaiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAkLoKYW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5485646441cso1401550e87.2
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740684333; x=1741289133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cocSoxI0vBLolc8jUN8YVirpU/dxiOfgNogxYs9IIlU=;
        b=fAkLoKYWbB1smb0MmWerQMnqZc2yXnz2LFwjANzYgv0g+P5P2HU6AQNpX2QZ6eSUPb
         nX0AhH6K3cYmPb3WpDC8tYM7JVZrwjqZCFuxzSHZc5Q7g43J1kaAYpRzN+sQQZD3z5mA
         F3BK1TT9EqMxeGaeAaLjMiYHXcE7P08IubaFw38QFqd0Ft/8pBBb2VuF6+Vk6ou9Qx2S
         Sjmo+Mbi9agE9ycZQ1ZkWZctSK4vQnP9zwR5rq27ntL1aUOrNzeXssu3KwpFCaUMArIa
         6fRCHMXEzyM2hH/gXdzCHEcW26PO6dL4DBoGt0yF3A+CWVHGRfImXvX9iItyQcZPGKuQ
         USOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740684333; x=1741289133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cocSoxI0vBLolc8jUN8YVirpU/dxiOfgNogxYs9IIlU=;
        b=KZ8j9CnIpk2fz7pb6sUelw3ESr8ItutK/vd7smU+1/ez6pnFrdNV6kM2akaJeOQx5F
         lyT825XHnyr6ec2ecGrGwG+HUVFwnjDssPUW7Hq54KFam4zOwxnQYa6zUcwDgh81eVZF
         hT1XGaV4DY2zCPPWwm75EGSq5rx6quwwvY6vdfSn9JLAYarw1W8Tt3LNhsLmXj/swICy
         L44egYA7GWFEm0WHWJWt/zpPHEqwqcXs0SLqTlgAAl2P6sAg8q1rXbYeVk87xOVZezk9
         w0rMOzsi+WUJ7EtDvQuWDghW6BED1m+urPnEXvOxuQwQLb1YXkl9yZPqOlrXn/9K2FMG
         E/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVTqleOik9mUKg7VMDZz8tMpCJ8ZpHug7vAL3pfJEhgKDr83SwNs7LU0+zryx7WTxzpDXcj0016@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu3WWR5IGIw2ooUiHvYqPCYpqQYePNO0GZZW08Va5ctjpJxEwz
	TbG2GpqDQZFE00dlOmOkBm+O1+dopG9m7T3mbBX6BzupJ9melmeRTfALDSrjzKv7w/nXaDqR45Y
	A+VBpwK56lQPNa95Kc9Rde1m8obc=
X-Gm-Gg: ASbGncs5oWfhaz8lGB6HWUTpBQ1gYYohTCwsfuPHbxzdt4tO9uoSVbm7kZlQmbVaH03
	fuY/Fq7r2FAFsAncuhzcrYOFxNV0MAgiL5Qlq90K1X7jwSBd+PU4ie/oNlOhY7rqhjBMMeWttri
	CZDSgdoyiR
X-Google-Smtp-Source: AGHT+IFSs2bI1kvd8svQvV0yYqC4L2f0QU31S933XS4fK48/mlI2CA8/SvzCilIe1uYB4dcFtVyxl2+NSdpFe8SrYp0=
X-Received: by 2002:a05:6512:4021:b0:546:2f44:ee99 with SMTP id
 2adb3069b0e04-5494c11b5b0mr270889e87.17.1740684332213; Thu, 27 Feb 2025
 11:25:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CANiq72mdzUJocjXhPRQEEdgRXsr+TEMt99V5-9R7TjKB7Dtfaw@mail.gmail.com>
 <lz7hsnvexoywjgdor33mcjrcztxpf7lzvw3khwzd5rifetwrcf@g527ypfkbhp2>
 <780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de> <CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
 <f3a83d60-3506-4e20-b202-ef2ea99ef4dc@ralfj.de> <CAFJgqgR4Q=uDKNnU=2yo5zoyFOLERG+48bFuk4Dd-c+S6x+N5w@mail.gmail.com>
 <7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de> <CAFJgqgS-S3ZbPfYsA-eJmCXHhMrzwaKW1-G+LegKJNqqGm31UQ@mail.gmail.com>
 <CANiq72mw_zo4ai7QWD5eLN_oFXE1RVkotFsGS+f=6LRmJoHM7Q@mail.gmail.com>
In-Reply-To: <CANiq72mw_zo4ai7QWD5eLN_oFXE1RVkotFsGS+f=6LRmJoHM7Q@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 27 Feb 2025 12:25:16 -0700
X-Gm-Features: AQ5f1Jpv6efWrpBsz_NNHvYeXfkaD5e-40YnVta7Hcw-aWaliwo1gWLR8BsXl_0
Message-ID: <CAFJgqgR+hFY3XkUusq0HkdgUEp54kpQH7zJi8WcgYNB7i33ygA@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ralf Jung <post@ralfj.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, torvalds@linux-foundation.org, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 10:59=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Feb 27, 2025 at 6:34=E2=80=AFPM Ventura Jack <venturajack85@gmail=
.com> wrote:
> >
> > I have seen some Rust proponents literally say that there is
> > a specification for Rust, and that it is called rustc/LLVM.
> > Though those specific individuals may not have been the
> > most credible individuals.
>
> These "Some say..." arguments are not really useful, to be honest.

I disagree, I think they are fine to mention, especially
if I add any necessary and relevant caveats.

> > A fear I have is that there may be hidden reliance in
> > multiple different ways on LLVM, as well as on rustc.
> > Maybe even very deeply so. The complexity of Rust's
> > type system and rustc's type system checking makes
> > me more worried about this point. If there are hidden
> > elements, they may turn out to be very difficult to fix,
> > especially if they are discovered to be fundamental.
>
> If you have concrete concerns (apart from the ones you already raised
> so far which are not really applicable), please explain them.
>
> Otherwise, this sounds a bit like an appeal to fear, sorry.

But the concrete concerns I raised are applicable, I am
very sorry, but you are wrong on this point as far as I can tell.

And others also have fears in some related topics. Like the
example I mentioned later in the email.

>>[Omitted] several
>> issues are labeled with "S-fear".
>>
>>      https://github.com/lcnr/solver-woes/issues

Do you have any thoughts on those issues labeled
with "S-fear"?

And the argument makes logical sense. And Ralf Jung
did discuss the issues of osssification and risk of
overfitting.

I am convinced that succeeding in having at least
two major Rust compilers, gccrs being the most
promising second one AFAIK, will be helpful directly, and
also indirectly allay some concerns that some people have.

> > You mention ossifying, but the more popular Rust becomes,
> > the more painful breakage will be, and the less suited
> > Rust will be as a research language.
>
> Rust is not a research language -- I guess you may be including
> features that are not promised to be stable, but that means even C
> would a research language... :)

I have heard others describe Rust as experimental,
and used that as one justification for not adopting
Rust. On the other hand, companies like Amazon
Web Services have lots of employed Rust developers,
AWS more than 300, and Rust is probably among the
20 most used programming languages. Comparable
in usage to Scala AFAIK, if for instance Redmonk's
rankings are used.

Best, VJ.

