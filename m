Return-Path: <ksummit+bounces-1875-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F0A42565
	for <lists@lfdr.de>; Mon, 24 Feb 2025 16:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26113B9614
	for <lists@lfdr.de>; Mon, 24 Feb 2025 14:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F7F25A32D;
	Mon, 24 Feb 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDLN9h8o"
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568418BC2F
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408475; cv=none; b=aEFG6Zii4SwjP2kKWDSshc3imWffM+IXzYYsGog0tycOMpYsE53cStN4FALlX4G4L+0YPs/fShvfbs6unnOjJ3xlsnGueQqvAq+jIQ9/mtyTCsQ6idQzu/xGHAIfQzH8tBO3O/QlwoBHg298Dc8F+9h5ci17i7Xl3xm+5ufqfOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408475; c=relaxed/simple;
	bh=89ktW5BzAn9iOHa5jek6f3ZHeVoyWQD1oH7vDvuK3rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFLCF3uQFYo+LSF5amgZyW3NRPzxNI0lvRiD1rCGBomQfuP6tYQApGmQvZSHF8yie+/OEDdHtYd/pCpxL5JeAs0ekjuipp1tCZ0SLURWODzg3JjWKgOq352rRgwTzNYOgmCogy3jRd4XBXmV/R9OS7nLE2lsC+FkvK1EZuu1kzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDLN9h8o; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc95e20e72so1229249a91.1
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740408473; x=1741013273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtB7Dub5njCes9mrJllt2CsrhPv34KUY3ewp7hLxbD8=;
        b=LDLN9h8oj4jRmvQrCQ82VPOR9EaxJRYz/KFEto1fcYpnX5yZX4HmTCJjRuY0QakNW0
         4fl0ckJmcC8lm0bi5wud8mCEEa9aOvcHUpu4rBxICsVKb4cgOA6FGpY9RC0gZIPAAgOV
         m27xv6/up2b75byNzk948khsrxq1Yw0F0cbO2MfH8kviHYuMb+i6xQP49sTW4dJmKoNy
         QOifqo37/wNEKFun/oKL2uuJQdXBf0NtqSsA6y4JdP8mhip7BjBYuz6ke2EDWKQcCRxE
         p1BbDGBd86f7RAVbYx1+DefvU1uhZ0FXkrH5vqZShIumDEc980Mdcoa/u//bWqivI49C
         bsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740408473; x=1741013273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtB7Dub5njCes9mrJllt2CsrhPv34KUY3ewp7hLxbD8=;
        b=hIxJnVyMKhGmu0Ag8lspXu0GCRObqfS8LMZofWKvlxXqJEMo/gzJziKbpjyTXPHkYJ
         kIZxTCc1STvrAskXbfKv/6VLbIWHNk9eLdDFBYGztjK/tO1ft8VdLcWICqiaSF2Go1Cl
         0S1EspoG+W2iLsTeBFZfcbBIV03+u6JdWtrRAYCw7+9J9b93prpcSY6LQrnqU+lIusUc
         Na5tZbJ8oXCkIZiEGhkJm3XJ4We0egt98MVPO/JGlyzmEILP3Dy7vcSy+OJRcvrT66lx
         KQ2MFhzK+uaKi2HCr6J5DKgMgS+rr0x0WYT+R0Bn8BRgWtnLqgBfXlA8ntkaaNyHv0SF
         rkPw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4oyBvNrj20aEvtlovkMcsTyRs5pK6Gz9GvQNm1OSscrF5zED7Q5PxakK3AfxYZoqS9lrTAGc@lists.linux.dev
X-Gm-Message-State: AOJu0YwRilfQWepMgdEmGPrzJZE8zmvd9kLX34ThtQsYYveCl5LmOhPC
	k23Qwzqy6kOxHkW6BGz/8OOi7uIcrsoPFiJdktndGQppsaXl7KKIGQVGPyRqctUb7qG7lN3kVtU
	W9LMvgUsBuIHEfzq6+IQAdEefzpo=
X-Gm-Gg: ASbGncsAezAkLO6+LjK5MUk6JAJJNosB5sI7MfHYqKG9W1u7NG6S89Tx8Qb7EXehI+a
	EzYKYo8XsrXI0GS/coWHv2fp3hUnm2BD9jDZn5zJUl0R3hZUuItN64uBpZhbC6rysNzu1bWD3wv
	kl9nmHRvE=
X-Google-Smtp-Source: AGHT+IFtHAt/2673bkl85WSepaiv/6+wkEUSaW/P5TB+5VYx4rV2nWG972KMsbRKwHotrhVZYVS2P5weLvxESTGhMug=
X-Received: by 2002:a17:90b:3848:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2fce7af8da8mr8559798a91.3.1740408472804; Mon, 24 Feb 2025
 06:47:52 -0800 (PST)
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
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com> <20250224125805.GA5729@mit.edu>
In-Reply-To: <20250224125805.GA5729@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Feb 2025 15:47:39 +0100
X-Gm-Features: AWEUYZlCQihPBjrSNYZpOKd-BwVo0fXGumHDWwVlhI4X09pccnCoeiBNU37wuHI
Message-ID: <CANiq72k-K3-Cbnm=0556sXAWs0kXBCB4oR67M4UtD=fq=kyp7A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Ventura Jack <venturajack85@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 1:58=E2=80=AFPM Theodore Ts'o <tytso@mit.edu> wrote=
:
>
> Hmm, I wonder if this is the reason of the persistent hostility that I
> keep hearing about in the Rust community against alternate
> implementations of the Rust compiler, such as the one being developed
> using the GCC backend.  *Since* the aliasing model hasn't been

I guess you are referring to gccrs, i.e. the new GCC frontend
developed within GCC (the other one, which is a backend,
rustc_codegen_gcc, is part of the Rust project, so no hostility there
I assume).

In any case, yes, there are some people out there that may not agree
with the benefits/costs of implementing a new frontend in, say, GCC.
But that does not imply everyone is hostile. In fact, as far as I
understand, both Rust and gccrs are working together, e.g. see this
recent blog post:

    https://blog.rust-lang.org/2024/11/07/gccrs-an-alternative-compiler-for=
-rust.html

> developed yet, potential alternate implementations might have
> different semantics --- for example, I suspect a GCC-based backend
> might *have* a way of opting out of aliasing, much like gcc and clang
> has today, and this might cramp rustcc's future choices if the kernel
> were to depend on it.

The aliasing model is not fully defined, but you can still develop
unsafe code being conservative, i.e. avoiding to rely on details that
are not established yet and thus could end up being allowed or not.

In addition, the models being researched, like the new Tree Borrows
one I linked above, are developed with existing code in mind, i.e.
they are trying to find a model that does not break the patterns that
people actually want to write. For instance, in the paper they show
how they tested ~670k tests across ~30k crates for conformance to the
new model.

In any case, even if, say, gccrs were to provide a mode that changes
the rules, I doubt we would want to use it, for several reasons, chief
among them because we would want to still compile with `rustc`, but
also because we will probably want the performance, because some
kernel developers may want to share code between userspace and
kernelspace (e.g. for fs tools) and because we may want to eventually
reuse some third-party code (e.g. a compression library).

Cheers,
Miguel

