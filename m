Return-Path: <ksummit+bounces-1829-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA4A40834
	for <lists@lfdr.de>; Sat, 22 Feb 2025 13:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FE5705378
	for <lists@lfdr.de>; Sat, 22 Feb 2025 12:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC78220AF64;
	Sat, 22 Feb 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJtvBIHJ"
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BA3209F5E
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740226253; cv=none; b=Vno9mvkGBVJs3TNmrkkyVDLDh//lzv6BCu5oi9QgZ+pIniVWECq387Epu+aXEt5wwvr+4Z8qB/+0gDREqeMWB7vfIgW74aLXXUHyhlwVkT+fRDusYod5xe8UGZj77FE64IirtU1HC5kIbKoWJmeqSXUgD3OSMWe1dldyaYhWMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740226253; c=relaxed/simple;
	bh=MgvWp2fU8cRSYuXc3PLqXYyNhfOEr9R2ZsHvwZiMKxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyHgSfXKaobfMMAa+AaIUwwnKCYSI5V+IutQMpj0IzrNjPAMJGlLPsZsBncvtfYRF3jGwMlNZJ5LWk65nRLd91ide7nMwaD8NWl+BU2VolavWGuh61LEkF2xQ7aYIJKgWjgZbfTxJkWulyXviqx5W3K4esF05s+7DVGZft/lVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJtvBIHJ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fbf706c9cbso714263a91.3
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 04:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740226251; x=1740831051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgvWp2fU8cRSYuXc3PLqXYyNhfOEr9R2ZsHvwZiMKxM=;
        b=DJtvBIHJFKo6Jry++tUggxi3Nk88pIbDZECcOKijCtiU4M0GuOvxZRkPf1EzPsCgDk
         DUlzFn2qSnnOcfIwIhdXcCV6dWy2ACNNFSy3DZp1DUqjeosPrV67LeyRRKlzUJa3bWl5
         z4Gs6z3UK8rn3Ia5dW61lgP0vio3n3kBYNnJN36zi9P8A+M5yV4YfOOs/XVVoGNMHFC4
         ghQlxq8wwYfQ9FMelgV0LXrsIi3iTYdIPDrXM2s/RGRneaVXW8kKrQS9FD+eYXUoR01+
         sooXI22w5B2OwDZRzTAc0t3gBYy2sOH8Moz5UUWBgAKUxHY1BPecRvlIlPLgCqq6HAKF
         V+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740226251; x=1740831051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgvWp2fU8cRSYuXc3PLqXYyNhfOEr9R2ZsHvwZiMKxM=;
        b=VSmY7F9RRGDS8js5KwGCOQJYJ5zhl1nd4bWGSTiquoBEATeF6RZTMI8GnpsMSOzZzE
         TBxZ2E2MF/lsOFGpsF/tOclu2GPb8nr/QDFtdVRaM3mvngSmKRxBo8bpWmKw75SPfsRp
         MHEbZn9XkS5VaedjJg+7i8vgFbPmiqx4Wa14VlIBQhh575HkpLNCWb0+mDl/91i/f1vx
         J23Uo/a2NhgzLeZDyJcBURjrOqTmUAp+hygqos7liIWU92TIjrDvkyWrlm8vv+2R38F3
         BDeZjeBqmVt8DwnIt0tvyOqI8d37p9OAk50MYivsZIoHeprQQPGiEBvC9W0C+9XTRrEu
         MSAw==
X-Forwarded-Encrypted: i=1; AJvYcCUKx1l5sBBfciiW0tcho2e34ChLq6mJkx0EaYjYGjeDbDYIf9AS4mn654wJE6IjODw/WSaNjTCj@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8RguF4n2UR3YJtBMUkRs56vmQP+hQSirOUZ1isrFmPgRrGzdK
	Kp45fntuMG0MiOIN4VY6hAVtuSfWsJVDSJIXTRcHFqxgNnvTUtQaC8jnIuNKLTNwxUtkmvgpkgT
	gpsWxDLGr//lspyWJ58+cIwj1W44=
X-Gm-Gg: ASbGncvamtl7IPngqKmgP6QfpIB2NFFwWPuZIEhllHhnsPX1O0SVPYiu4qULtatxFBi
	z4bNQiWsQm/uMYLA9iCL7FLUHzLGXBzoSyNbyqE8zU3A2sfyncUWCqx0FjpdNZdFI55QTXkJDc2
	5Jv5sS7XY=
X-Google-Smtp-Source: AGHT+IF0pyohXYCjYhyyxWf9CDhgHe5H/cXs7TEy1INGL4P3qixwcQboYbY0lqUxFL9jjIUW/3DYIbAIk5t8CWKtqk4=
X-Received: by 2002:a17:90b:164e:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2fce7b3e1e6mr4177023a91.3.1740226251391; Sat, 22 Feb 2025
 04:10:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <202502191026.8B6FD47A1@keescook> <20250219140821.27fa1e8a@gandalf.local.home>
 <202502191117.8E1BCD4615@keescook> <20250219202751.GA42073@nvidia.com>
 <20250219154610.30dc6223@gandalf.local.home> <97841173-1de8-4221-8bf3-3470a5ac98a7@acm.org>
 <89f2547edcaaba53d9965cab9133d809607330ac.camel@kernel.org>
 <87pljc6d7s.fsf@kloenk.dev> <Z7c3PguDn-sEl3gm@kernel.org> <Z7hTLsaqNU0rlpwV@kernel.org>
In-Reply-To: <Z7hTLsaqNU0rlpwV@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Feb 2025 13:10:38 +0100
X-Gm-Features: AWEUYZnFMbcXcM_cmwCNu3bqG_ZObq6D9dYTD1hB0D8fCjGqpA9knVhUl4gNSrg
Message-ID: <CANiq72=p436WBxwebWsEb2Quq0=V4NLMdxRDopM1zrcykk-uzg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Fiona Behrens <me@kloenk.dev>, Bart Van Assche <bvanassche@acm.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jason Gunthorpe <jgg@nvidia.com>, Kees Cook <kees@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 9:14=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> The reality of actual kernel development is that you almost never
> compile/run host-to-host, rendering that part of the documentation
> in the battlefield next to useless.
>
> Instead it should have instructions for BuildRoot, Yocto and
> perhaps NixOS (via podman). It should really explain this instead
> of dnf/apt-get etc.

We need to keep the package manager instructions -- there are
developers that use them, and we were explicitly told to add them. So
we cannot remove them.

And, anyway, that documentation is useful to know how to install the
toolchain in other systems/runners/... that use those
packages/containers/binaries.

As for projects like Buildroot, I think it would be ideal to get the
support (or the docs) into them, rather than in the kernel side (plus
I don't see them mentioned in Doc/).

Cheers,
Miguel

