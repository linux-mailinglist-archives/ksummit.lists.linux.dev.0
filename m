Return-Path: <ksummit+bounces-1928-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D2A46476
	for <lists@lfdr.de>; Wed, 26 Feb 2025 16:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046A73A3919
	for <lists@lfdr.de>; Wed, 26 Feb 2025 15:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101AE224885;
	Wed, 26 Feb 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5SjwM3S"
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E842236F7
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583322; cv=none; b=dbamqrX6y13AS9YIjnOMy+eTrmGudNOHyf3ScNRglypylYw5AourpYajN+I1lJB/8cXR4L2jfJs056Y0/2NomJuE6FcgkLbpLSE/2mUmt4718DyL4DVtQVVYCm3R9aW9RurWrlaBV2z6JOB36drT0PL387hLqMIYWAglSP7NWz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583322; c=relaxed/simple;
	bh=yU8gNYOdF+KZIK43kgv3VmI3q8AVM3zFnCh57wmb8KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEiKFCt0SRaHJARfLEh5e1ROs95myX3WO9x0Tju3ug/jmxsufnx8WZTPWjLVra4tgnjcIna7EJLK+EX0+7k/Ct/dtEyxaC+ED2L7XHMIx6o7w8RPYz2LW4zQe41oNvWURsdABcnnRMt3pCG0ftRUZiY2fYsoKwzcK1JyZHkGqvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5SjwM3S; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30930b0b420so60938461fa.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 07:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740583319; x=1741188119; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0hFN/Q5bioCyAT9aA3v+FnRq1GwqeK2EWDX0R9FPAE=;
        b=d5SjwM3SESgiTAV7bjCwxGuOuXWHriu/ezFDhu6cXfhERElPlSVQ6V42wuJ0V/0w0O
         kUBDPjF7R8RzodwqbUySjd8osVoQMntZf8Oq9OhpXwerBflV9D9coaQ/+W+7CmuQ26tE
         6GRxY+ON+rGJMose6sBXlLjLtQQ/hVJZoOSYi+r6+y2JS0B+6jVPO8RjeuoshZXyZQ6Y
         iQormuuI2dvIwhZluGGgOf4jxEmVJjLfyVHVV0dlWyIs3lTOMrnAK3+KBW/THtH4LRDn
         km0//UA9umwXMXyvJzGNJ7pETlZd+1VfYGzkhSq3FoVCPDKDD39edz14BhYosj8x049Y
         0h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583319; x=1741188119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0hFN/Q5bioCyAT9aA3v+FnRq1GwqeK2EWDX0R9FPAE=;
        b=GpfHkAHQ3d3IofYy2BeRoIbHTQaJVC096/GpbsF8tKgjRrRCanGoKzJQ+SpnteU2MV
         jS9r8lnVfUIAtO7Zk6afSMPsfGgkZ4xQDnKWbEIPZdiFU3AUQmLTSZ6KosHFzN3vmzo1
         VlhWLyla0l9o4NxFoVOuZJe1hCAJaTIHt4uhlJHk5En9crf03cg7UxRWjBQOa5ZZONJn
         8lExmlOgng86R6xhqZipHO/e7QXDhBgHNyozco7+hN1pArelPBU75ShyrWGuaQOvFCqV
         iUNfzH4Fwx90h3s4CrBsSRxMxn55dG/Ij5mXIvICO+6h8ap5Hmf9sEUPN6bFd3DD8/Oj
         hk3g==
X-Forwarded-Encrypted: i=1; AJvYcCXo6Jl1VCIoyBW2dwNhrUgXJNvYb4wiXeTYgIxxGtdzOaYdFVrzQsVicau7kDgHJs+hfTw1+Yom@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/SzyaE53iNmwEJCo1yqz/gzhVpXs0Geb0qxDIkG3gGsNGg5Mw
	zaDzPaVOmy7UCxXn2uZPZFFpN3sb2olRmVLuiOENUwQVeP0ZKFLelbPD5pyPxITZ+TK8W9NFLb4
	3zK4Y9fSIo5UwqbtpuK1bX3J+2iA=
X-Gm-Gg: ASbGncsAn5h9bNCQhd0Woln/Z08+9uNB8GVuirwO1ICHJ9KIZVcsv/15nKdauEl3+oX
	2wIqrLV9eR5vGRb/AS0a5SHCb01sEUYYe1A45LHxAepEfhaonqdbQ5z9ff7MzP71QHHXiSOSBH9
	vkshpij+70
X-Google-Smtp-Source: AGHT+IHyRHWjbncLImDyeksSRZpjsqLCk2gH0nyAOGo3WeXuQNL4gvXvxUYeo01VFKJKwqmTifGfFsF2qzF1qZIU/hE=
X-Received: by 2002:a05:6512:2314:b0:545:ab8:2be4 with SMTP id
 2adb3069b0e04-5493c57a2demr2783344e87.27.1740583318703; Wed, 26 Feb 2025
 07:21:58 -0800 (PST)
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
 <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com> <CANiq72mA4Pbx1BeCZdg7Os3FtGkrwx6T8_+=+-=-o9+TOMv+EA@mail.gmail.com>
In-Reply-To: <CANiq72mA4Pbx1BeCZdg7Os3FtGkrwx6T8_+=+-=-o9+TOMv+EA@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 08:21:45 -0700
X-Gm-Features: AQ5f1JqXNq_djDucaFz0JfQlyejxMXbHKVh9InZ_hpbly_lGP7oSWSDqQNXn0as
Message-ID: <CAFJgqgSzqGKdeT88fJzrFOex7i-yvVte3NiQDdgXeWEFtnq=9A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 6:52=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Feb 26, 2025 at 1:36=E2=80=AFPM Ventura Jack <venturajack85@gmail=
.com> wrote:
> >
> > In a preprint paper, both stacked borrows and tree burrows are as
> > far as I can tell described as having false positives.
> >
> > Are you sure that both stacked borrows and tree borrows are
> > meant to be full models with no false positives and false negatives,
> > and no uncertainty, if I understand you correctly? It should be
> > noted that they are both works in progress.
>
> I think you are mixing up two things: "a new model does not allow
> every single unsafe code pattern out there" with "a new model, if
> adopted, would still not be able to tell if something is UB or not".

I am not certain that I understand either you or Alice correctly.
But Ralf Jung or others will probably help clarify matters.

> > The aliasing rules being tied to a specific compiler backend,
> > instead of a specification, might make it harder for other
> > Rust compilers, like gccrs, to implement the same behavior for
> > compiled programs, as what the sole major Rust compiler,
> > rustc, has of behavior for compiled programs.
>
> It is not "tied to a specific compiler backend". The reference (or
> e.g. the standard library implementation, which you mentioned) may
> mention LLVM, as well as other backends, but that does not imply the
> final rules will (or need to) refer to the LLVM reference. And even if
> a spec refers to a given revision of another spec (it is not
> uncommon), that is different from being "tied to a specific compiler
> backend".
>
> Moreover, if it makes it easier, another compiler could always assume les=
s.

You are right that I should have written "currently tied", not "tied", and
I do hope and assume that the work with aliasing will result
in some sorts of specifications.

The language reference directly referring to LLVM's aliasing rules,
and that the preprint paper also refers to LLVM, does indicate a tie-in,
even if that tie-in is incidental and not desired. With more than one
major compiler, such tie-ins are easier to avoid.

    https://doc.rust-lang.org/stable/reference/behavior-considered-undefine=
d.html
        "Breaking the pointer aliasing rules
        http://llvm.org/docs/LangRef.html#pointer-aliasing-rules
        . Box<T>, &mut T and &T follow LLVM=E2=80=99s scoped noalias
        http://llvm.org/docs/LangRef.html#noalias
        model, except if the &T contains an UnsafeCell<U>.
        References and boxes must not be dangling while they are
        live. The exact liveness duration is not specified, but some
        bounds exist:"

Best, VJ.

