Return-Path: <ksummit+bounces-1778-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4815A3E8CA
	for <lists@lfdr.de>; Fri, 21 Feb 2025 00:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF17619C3852
	for <lists@lfdr.de>; Thu, 20 Feb 2025 23:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B42268FFA;
	Thu, 20 Feb 2025 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu74juDk"
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45017268FE5
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740095247; cv=none; b=fXrIrvH0i7WaXyC9/iejYndaGsqAuGYHkqeBfNjIoYnN9QrH6F8stKBC8xp9Kt5iv4xoaN4oNYoxOZjpVP55Slx/ukmqpTXhqUW6pUyqghtoqlfO/+RKpvZe7V6WHJ0Jg8z80Ub8maHrljlbuSOJZ0SpptrP9NTtDym6kG2gEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740095247; c=relaxed/simple;
	bh=uktFcM7ofiq4EF29b7l0zsd0L5DM5eWiNfdLEwXdeDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c32raZX8oFOcbTaQ2k1P2lCHHnmnIoCwwtzsHay2g/7l3292xlwQMp2GUS0DSEM/gKRWhqYMrNmqjIx+uaGvfGgqSQhQTIOV2D/+uTOA4l6QYzQXi4H5GQa2Wo0U2AwS4TNAe68OIhT2h3m20NmrzC1QVta6J8JfeT+BxN8mj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu74juDk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220d47b035fso3572035ad.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 15:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740095245; x=1740700045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcbiIWTlMI+SlCmwNzkzCWnSjlPgQuj2JSvyxeAzcIw=;
        b=cu74juDk5NZbDW5wsmouVTFPZd7nkD7+6O3yeTAkORKR7BZ08+aBvEU8L9BoP1rpLI
         eQPcq+XEcs9tjHeCzczHFmAxwVe+kCYR4bSrzNEEaJSfpaYSvva4kp+TxWtBFxeYFsIt
         Wnldxa/H3DSgcPaxPMTebgw6JkMuDvHrHcboOdzWilZS8hFFQkW/Obp36lw4Vi+egpD+
         SY7432KVnUfTSpVhqBb3dos06KSl6g4GyyoWrRJERJgUtN/cQdAsDOo1g+mrjvqWCTWi
         1iNeyvLatY6B35Ox46OSHShlky59YeIpcBCDFaF2f6wZtrXAcXlDmAS2FR3+kjOaGISx
         gWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740095245; x=1740700045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcbiIWTlMI+SlCmwNzkzCWnSjlPgQuj2JSvyxeAzcIw=;
        b=wSzt+IbIkcaaPr+HNQJABBufU5ttF4fJJBy4I58cTa6v1e3JgwWPA68JiJ5wB0J078
         7swcl8iVUFJNyncU3k6CH5vGNCIHk2jFlBH5zy9ftBI/1lj4ZyTbwZD3hEwQdqiM1JJr
         TV0Xie3eVGWQRWUrCabLMBKMj893TvJg/rJnm4ep1UlwFxUApys92rMJNBq2SZBz0Pqw
         gAUuVt2T6yve6KDU890ohTs8Fy1Q+lLMzFh7wLIPxvG+TBGoGa20YRjov8rOXTnVXh24
         xdbM14jv1QV6ks2x2hxRqEL2bhOHDcDri52hE/epFQdQ1WvSAdqgIkD0jmSVZ5aMQbrT
         gxFg==
X-Forwarded-Encrypted: i=1; AJvYcCVKpXpy7xzgx+h+uc0YL7CCoDDjBSQGHBJT4VLCbfic32NK9ArxT3rzg/NwATKIpZI0jb27Hfaa@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Yd0tEzI5ktT4xUxOq4l9WW8MSGTGylNXtQTV7Ynyr3Eceld8
	9r8fmeCbm7yJzcGMwKRIMOQ4NBoM8RSdOLxdoONjCWYh6kzYVPfu8Xo8s2DKG4gnagE2ZLm0DgV
	CeO9W9V+GNSDQqVgHtUf21u78OQM+iw==
X-Gm-Gg: ASbGncu0J5j0D6+d24DFd+NGnNzZZ8Fq+/DGmtvIBn9U11jJ5u74s3Xgm9+qRPVk7co
	tcGA7IEEJt2cbxNPDqcjXyjShP7nw0T4QvM9gpEFSVLtf6mVTKsmkgyLXneNcspXm3biFfFqg
X-Google-Smtp-Source: AGHT+IH0bs1iToL6V0EuNvifVGL6NdGd70byTgfL6uq1rCj0t+FM/MUR+8hVyUWrzlM/mFIo2B+AfXPCTdv+UQ+qRuU=
X-Received: by 2002:a17:903:98d:b0:215:2bfb:3cd7 with SMTP id
 d9443c01a7336-2219ffba7f3mr6709025ad.10.1740095245464; Thu, 20 Feb 2025
 15:47:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
 <CANiq72nnnOsGZDrPDm8iWxYn2FL=wJqx-P8aS63dFYez3_FEOg@mail.gmail.com>
 <a627845f73f2f7bedc7a820cfdf476be9993e30f.camel@HansenPartnership.com>
 <CANiq72m5KB-X1zck1E43yffXOTeD4xRmZgDx_oUiNwR941ce0w@mail.gmail.com> <f7b44799a3feeab3b255f3b0fc4dc164aa72a6d7.camel@HansenPartnership.com>
In-Reply-To: <f7b44799a3feeab3b255f3b0fc4dc164aa72a6d7.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Feb 2025 00:47:12 +0100
X-Gm-Features: AWEUYZmirNGIZrUdh84qKrY2kE8MT5a1w-XvyAHf-8actLBHDItgVVCNV612XPw
Message-ID: <CANiq72nDcXrSo79-nsM_Cu-npoVirksiRpPYJiPrcsB5OEVQag@mail.gmail.com>
Subject: Re: Rust kernel policy
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 5:03=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> OK, this is just a terminology difference.  I think of bindings as the
> glue that sits between two pieces of code trying to interact.  In your
> terms that's both the abstractions and the bindgen bindings.

Ah, got it, thanks. I was confused by the "headers" bit, because I
didn't know if you were referring to the C ones or the Rust "headers".

> You say that like it's easy ... I think most people who work in the
> kernel wouldn't know how to do this.

Yeah, in the general case, one needs to know Rust and how the safe
abstraction is designed. I only meant in simple cases like the "gains
a parameter" I was giving as an example.

> I'm under no illusion that this would be easy, but if there were a way
> of having all the information required in the C code in such a way that
> something like an extended sparse could check it (so if you got the
> annotations wrong you'd notice) and an extended bindgen could generate
> both the bindings and the abstractions from it, it would dramatically
> reduce the friction the abstractions cause in kernel API updates.

Yeah, it would definitely be amazing to have. Nevertheless, I think
annotating C headers is still something we should do as much as
reasonably possible, even if it does not lead to full generation. Even
if Rust was not a thing, it would also be helpful for the C side on
its own.

> Yes, I think it does, thanks.

You're welcome!

Cheers,
Miguel

