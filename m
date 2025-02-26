Return-Path: <ksummit+bounces-1946-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC0A469E7
	for <lists@lfdr.de>; Wed, 26 Feb 2025 19:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F5B1889634
	for <lists@lfdr.de>; Wed, 26 Feb 2025 18:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36612356B7;
	Wed, 26 Feb 2025 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m59D9Gag"
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EC323536A
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740595033; cv=none; b=m13M6pBOi1uJn6iSB87/zif0Y11+/wT0A3uVkciVBEpiJr/Mfk3fkcAnoXpMLQenfMwWgugAceqk/jvlHDe7qqL4m9jkaWupsa9Gh5gjYudt4coePtaTKMw9HvQgdOA7cu2D1ZForLJiJcSTarA3gu8kTjwYKuLEY4Fr7E963gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740595033; c=relaxed/simple;
	bh=k5ajxCLl2hy7Mwsz9QDoIJjT29KvjQa89jMM3NFwxSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxIlFtP3539YJG1zDdYhvbtmZVSibYauL2TmPNc+tvM4r4roxgdpQVa9Hjj1RajFeAebXr5UHfJaHGV6tcMFLNUJek23CAmz79r+FpBmB9kpOMA1JSDSGvy6cfcwFuFIi027FkpUPNxwjMpvRaz61o8Uio2qoCMD9agWw+aobZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m59D9Gag; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e4b410e48bso52186a12.0
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740595030; x=1741199830; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDyTJwKN7xH8PBcSTb/l/mb6insdu/+iQsdQ5QiBDRo=;
        b=m59D9GagRQi4UuT4mW08uQPzU4bYxPsS3WCkFBXSJhx4UNh7d10KRzjZEB+HBbS4no
         ZkknEk2fwRp/aAOytG/0VHovJfbp6qNS5dfiebEhNtom8Nd0s0a12vFK7cK0wGeIgaOg
         npa4MnL3ldygB9czf+GdVAqHCtLv0q2BC3HRjMqjsqm4i7Ur4qHZe8fZJ04N0I1Fc/i3
         KC0f23iiR4bm4UMyz6turm0HGaTBCM8WS2s8u2IVeVzMsFXeovW9hoDItWcu7NBCKomG
         MCFKlyHsZaboqH1gGg/HgY7rWsSQ2L2hO57Wns7iERkgIYk5VKPw8cNtNur7L/vKjnFe
         qBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740595030; x=1741199830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDyTJwKN7xH8PBcSTb/l/mb6insdu/+iQsdQ5QiBDRo=;
        b=ARtkmS+lt0nArWF5nc+DKjqsEySn1n5+ySnr1Tzr8n7ZldBnXN8IZeYRixJPkxs6bU
         bkOY7rvauRLOX91Y8dXOKP6geB9+HAk3ZhQm9qBryMoylp5D6i+m0mpHbL1VJLpg1WsK
         dqY0V/s5lFVo/eAADQQLNZKlbd4dAbJma2BTT1O9m8JYYOloda982VK7zf14qb3fF/5c
         YFWt1hP5tzIHuP0suyRubasxXIFjUkD5lxA7IDX/BaBMmL7v7GLBVxNX/X9f5NwdUtIK
         pV0qhmUYXev5yUq//kaSzP5qcAdc0hfmDKkiR+kQK8M49Gd0sb8y41D/z3348U2v0TbQ
         /xXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnKShBBLkiMQopf6gHL7fsIzA0/IQet+MOhy5Qip9A5emmd0nfNq/GnPCIYE1A6RnzznJoIjts@lists.linux.dev
X-Gm-Message-State: AOJu0YzxJ2iGAeU5mukMaPIdQOZ5OdmHKJh27QooFWIkWnm1voguackf
	hMmCAMu9FpweyY4L42AG6f0IugCzlA6K+vJntChrazcCCBM0B8TdqW4KBEhP3+vKrxe3kge6f59
	h34pplTNFZYdZcA6yS0v0RNowcnw=
X-Gm-Gg: ASbGncufQcZ9ih6jqHD07Amwtym+OGDVWFW1nljcfTDfk0Gd41FgdlCipmXFzLuHqtL
	5vfkCl3NKzFCkU1+UFOc35L1Ts4DELG+9KAxFBhVe8h4IlYY64Xpdy5avHptm+xjs7t9AzQzSTZ
	ELCTyafeIw
X-Google-Smtp-Source: AGHT+IFwLcDUFQzoI6ZilFXHLns1F2OC4wA9RbEZ2yK1MOX7/UATdtevigNUWQXX1Z3qVM5GQ+e+CMmylXNmvo/pWiY=
X-Received: by 2002:a05:6402:34cf:b0:5e4:96d6:c125 with SMTP id
 4fb4d7f45d1cf-5e496d6c286mr7924846a12.18.1740595029719; Wed, 26 Feb 2025
 10:37:09 -0800 (PST)
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
 <CANiq72mA4Pbx1BeCZdg7Os3FtGkrwx6T8_+=+-=-o9+TOMv+EA@mail.gmail.com>
 <CAFJgqgSzqGKdeT88fJzrFOex7i-yvVte3NiQDdgXeWEFtnq=9A@mail.gmail.com> <CANiq72m8zKABR0dXtkB-UiF-GeP5J4nAGqoabdmR=CfPsJejzg@mail.gmail.com>
In-Reply-To: <CANiq72m8zKABR0dXtkB-UiF-GeP5J4nAGqoabdmR=CfPsJejzg@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 11:36:55 -0700
X-Gm-Features: AQ5f1JoMsdSV_5Q6RV31sCAY_-vLSrZRd2z8Vs5ljTGycnjUxfCGKTNJLyBrya0
Message-ID: <CAFJgqgREAtPkx+r_QNPnt-bOekjVjCNBv=tAuuEC6dT2HCA0jg@mail.gmail.com>
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

On Wed, Feb 26, 2025 at 10:49=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Feb 26, 2025 at 4:21=E2=80=AFPM Ventura Jack <venturajack85@gmail=
.com> wrote:
> >
> > I am not certain that I understand either you or Alice correctly.
> > But Ralf Jung or others will probably help clarify matters.
>
> When you said:
>
>     "In a preprint paper, both stacked borrows and tree burrows
>      are as far as I can tell described as having false positives."
>
> I think that you mean to say that the new model allows/rejects
> something that unsafe code out there wants/doesn't want to do. That is
> fine and expected, although of course it would be great to have a
> model that is simple, fits perfectly all the code out there and
> optimizes well.
>
> However, that is very different from what you say afterwards:
>
>     "Are you sure that both stacked borrows and tree borrows are
>      meant to be full models with no false positives and false negatives,=
"
>
> Which I read as you thinking that the new model doesn't say whether a
> given program has UB or not.
>
> Thus I think you are using the phrase "false positives" to refer to
> two different things.

Ralf Jung explained matters well, I think I understood him. I found his
answer clearer than both your answers and Alice's on this topic.

> > You are right that I should have written "currently tied", not "tied", =
and
> > I do hope and assume that the work with aliasing will result
> > in some sorts of specifications.
> >
> > The language reference directly referring to LLVM's aliasing rules,
> > and that the preprint paper also refers to LLVM, does indicate a tie-in=
,
> > even if that tie-in is incidental and not desired. With more than one
> > major compiler, such tie-ins are easier to avoid.
>
> Ralf, who is pretty much the top authority on this as far as I
> understand, already clarified this:
>
>     "we absolutely do *not* want Rust to be tied to LLVM's aliasing rules=
"
>
> The paper mentioning LLVM to explain something does not mean the model
> is tied to LLVM.
>
> And the Rust reference, which you quote, is not the Rust specification
> -- not yet at least. From its introduction:
>
>     "should not be taken as a specification for the Rust language"
>
> When the Rust specification is finally published, if they still refer
> to LLVM (in a normative way), then we could say it is tied, yes.

"Currently tied" is accurate as far as I can tell. Ralf Jung
did explain it well. He suggested removing those links from the
Rust reference, as I understand him. But, importantly, having
more than 1 major Rust compiler would be very helpful in my opinion.
It is easy to accidentally or incidentally tie language definition
to compiler implementation, and having at least 2 major compilers
helps a lot with this. Ralf Jung described it as a risk of overfitting I th=
ink,
and that is a good description in my opinion.

Best, VJ.

