Return-Path: <ksummit+bounces-1706-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F1AA3C329
	for <lists@lfdr.de>; Wed, 19 Feb 2025 16:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEBF11749CD
	for <lists@lfdr.de>; Wed, 19 Feb 2025 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8895D1F4170;
	Wed, 19 Feb 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cf5/79Z4"
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D561F3D54
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739977725; cv=none; b=L3eeBqCl48Ii6LINUf5aMAn7QhaKKrEct2BDQwJDYdVUsx7/ccHYvdCjfUhDh/gjxBpDulDBXGt9klOwwo6rzuhp+gpay6dmJmrKrzSGEe6mlwlgl/MZ7IwipwUPwtLb0MqRG44lEhiF2DH2SN9Ab8os7NZjrtDYaVS/0MYhRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739977725; c=relaxed/simple;
	bh=YlhF6ctvtEWQSP6s0OMQfJh4WMP7w3RXqHU+Ce5NlNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9DXVxs3+lOPZeC4JAYct0DyCjwkARBe2VZYwLQ8LZCf1JTjQdV1pvOrTGp1qncfKcVbkQHsY4YewnhZ04OWLXZiin5cg+T7VN48ZHq9yRqGGpM9WDbOO9/6miF4Jbv/JEQO9GuKPaPShabdUsGlC1s8dOYg+UX/+lTYrRg3Iu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cf5/79Z4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0ab102e2so1549861a91.1
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 07:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739977723; x=1740582523; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyrCL7AExcqf2mJIChj6omMmtS/RWri2tSbYlvAvrAk=;
        b=Cf5/79Z4lWnkzmi3WWtxtMtHrLKRC/DcKh0AvaMhJnao4th1CwuqyK5u8yiJcRpBzg
         1EUU1vksgyN52CvkcjQQhgvxMWurnG6SRR5ib2YjzOX/tLGpOGaeZ/UBEHmQkElicnVj
         bR/kdzIJd0XIIgKsgxddO/RHUdvjhYwYzUG6yEzvOP0g0vpIj1/v3wFvsXAZu2Uarv2b
         rXUIYAoVcTajJ19Ut+V+LhJ1c3fUw0X2T+Ny3hNHpV0EjzWyIpsV1gV/xxGMpylx5k5x
         fmnvCnXZMt4+u2r87SG3nmJpHCngMo0XwdWcmBCX+YKub44Q8FdjmrFuI01lX+49DlBw
         AjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977723; x=1740582523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyrCL7AExcqf2mJIChj6omMmtS/RWri2tSbYlvAvrAk=;
        b=UhpYDKg1km8TIqA65LQn3AXGTj91Xp1BO+V9eP16q0tQE/6Hh2w6kS/HUzkhXxTzAO
         wq+1fOmkpBxjsM59k8cbpEfBF9mJVf0WmWX3NWpP4/57Uys2ao/aW+RGVv8RTDvrs0qX
         CBku1XrnFXGJ0i6y0k3msfVEoCJXWfBxDCzlrTUUiuMot+CoaAn/MtM7THZ2dgGQeuC0
         Za441fkadCdjI8HsI0AV1yDmRmc6wqMBtZC3/+r0LaHuiosFEDiIrmXrBhkWO0VoWfl2
         Zt390vUHF1uelmgeIWBw/754ke3b8mbbvrR+4CT7t/B/qc/zMIbonDMcNotiiWdGYXYr
         GRHA==
X-Forwarded-Encrypted: i=1; AJvYcCWrURUG9EQsSf/KqZLECKHTXhPt6HOFv1Y4K/FA71pMJ0a0JOuqBH9+gUAwPaZJBMmJrolDwzbC@lists.linux.dev
X-Gm-Message-State: AOJu0YyC6HtVhgdgw/RR219TI/9hj75XHb4NfnS2ll+6FSUMHBNMJ08O
	wQrR6Szdv/tjij8+J4fU8p8DyoMyczBRvceNfFrAeufOrua7XL9FiZ/mlhUR//oXeVxtGMQ0sJu
	qwO69pihkajspd5mlQGPBNh5nP6E=
X-Gm-Gg: ASbGnctoi77LWNYBdHJLVxV2FenpX7ZUUhCzrgqrKMPphHQIH3GXbQGvy0+xtt2qBKS
	/sQzLKt/7Wy8SjVtyBo5zhEtktxXAmVjcuSzjdLEkhxX7/4CObNEss5P9sqH5PIH1DbSOIxeR
X-Google-Smtp-Source: AGHT+IH+XXFFqREGae+Jscoz9PXcdZChejs86ET9tFEqvQY7Kg77JAOIP1felOCfWJc/ETpOt6vTAb5nokAsDncHqZQ=
X-Received: by 2002:a17:90a:ec8d:b0:2fc:25b3:6a91 with SMTP id
 98e67ed59e1d1-2fc41150517mr11101501a91.5.1739977722483; Wed, 19 Feb 2025
 07:08:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
In-Reply-To: <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Feb 2025 16:08:30 +0100
X-Gm-Features: AWEUYZkyIVWX61WED-R_1ZbnvG_dmuQ0gYKwzOWG8-HIy6fPvnyinMwk_TWfF8g
Message-ID: <CANiq72nnnOsGZDrPDm8iWxYn2FL=wJqx-P8aS63dFYez3_FEOg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 3:05=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> So here's a proposal to fix this: could we not annotate the C headers
> with the API information in such a way that a much improved rust
> bindgen can simply generate the whole cloth API binding from the C
> code?  We would also need an enhanced sparse like tool for C that
> checked the annotations and made sure they got updated.  Something like
> this wouldn't solve every unintentional rust build break, but it would
> fix quite a few of them.  And more to the point, it would allow non-
> rust developers to update the kernel API with much less fear of
> breaking rust.

This has come up a few times, and we indeed would like to have some
annotations in the C headers so that we can generate more (and to keep
the information local).

For instance, it would be nice to have bindgen's `__opaque` near the C
items, or being able to mark functions as `__safe`, or to have other
`enum`s-related annotations, or even custom attributes, as well as
"formatted-formally-enough" docs so that can be rendered properly on
the Rust side, or even references/lifetimes with an eventual "Safe
C"-like approach, and so on and so forth.

However, even if we automate more and even reach a point where most C
APIs are e.g. "safe" (which would be great), it wouldn't prevent
breakage -- the C APIs would still need to be stable enough so that
you don't break callers, including C ones. It would still be great to
have that information formally expressed, though, of course, and it
would help maintain the Rust side.

We have also discussed at times is documenting the C side more, e.g.
the pre/post/invariants we use on the Rust side. That would be useful
for the C side to know something is being relied upon from Rust (and
other C callers) and for the Rust side to document why something is
sound. Of course, it is a lot of work, and the more we can express as
code instead of as documentation, the better.

Cheers,
Miguel

