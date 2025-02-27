Return-Path: <ksummit+bounces-1985-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C5A48296
	for <lists@lfdr.de>; Thu, 27 Feb 2025 16:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C773AC238
	for <lists@lfdr.de>; Thu, 27 Feb 2025 15:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433CE26A0E8;
	Thu, 27 Feb 2025 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUhk0i8I"
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078825CC95
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669136; cv=none; b=IwzhRXx7O/iyc69lErFZFJDCy3++KYTU26qQ98DSgvwk7Gx13Cbux/P4u9Sb9oy1UQXiUbMoe/uEDZ4PY3s33Hv4BHUA7JUgxuRjtwLLUMzrbJkXGXuBtlMHTzOmrXsEh2v+EGAvqjtOO9NMS901OsLLlT0Arfmn3AQ/CbiQ63M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669136; c=relaxed/simple;
	bh=hJrwlkkUVzio2wpaktL0L/Hd3mV1lQuzrfSl9WaxFYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEo2MwDsthTWq7UTsq/Z77aRE2njcjDuPPv+Tzi3YaM9EaeiCCo3mata46c7CVP//9Q5ilnUIx/aHWn/0+0OjpVzwKO4KPBJAK/7lOTRxoQdGIaBGnY5n9QbieH7TVaMpu3HN+PIrE0pLmlD9dpjvWYWazTRCreEdoCJDVwcSy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUhk0i8I; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so1078750e87.1
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 07:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740669133; x=1741273933; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gfn+uCBojQ5GG4YhEtPCwqVqkPReqrK18jN+sTrUXsk=;
        b=CUhk0i8IllC7sCYl0x8H2Wgmb0G1H47fRhhbU17xyOOVA3y/thLKbIlV6cLJczV4Mw
         VNFyq+c1ofP1EGqbcICjGE3KTyU0IyKHrFSYCRFP9nO2K20IrhE1DNFDEM7nuGOljRW4
         2IvcMRiQSuGK7kc8P3ucGPiWtFBfwu+QjUrZ/CdGc9QYiG59lgSAKuBx15xbGQZYII3w
         wXmWC8fNfryqKKZtlm5K3oEfCRD1XHAxOgTLTRpSqUiBiJd7VJFd8Y4NUrVSjos2kKI4
         1iwrP/64nAIsOEO92+sz3owKlpiE/w1QdYw/agrs7qU6+x7Z5PXLT/6atlfH5ZeI3oN6
         xF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740669133; x=1741273933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gfn+uCBojQ5GG4YhEtPCwqVqkPReqrK18jN+sTrUXsk=;
        b=gVIxDpS30sfvg6eGt9BWUQ5dgUPsXxn2zwz9a2OnPcycDbBFUTxq6ABHJ6dvVeROOK
         hZLmbx2dt65K53wM5jZlgAW2ErbjxOHrgjV9OhstIMksKz0OYziE2vYwxJfO9lsT3OWR
         Dlt9NBbhtckQ5QOuwzsf8AoiYx/rVWfSzkuMSHm6Ssncl/ExzRVGpt0ImYD9xLzfKc2y
         ZvBqTjQcg+ljv8Ui7wCQR0XsnUB7Ds/+i1rWkzyNLQ5hQZRis8KBuKPsmEhRgQUZAPEv
         g2bZFEahuoTPCPLCnqjFmYLmJ19t2YZ1760mi4y0VKUwit6wXRymLe/wv/bZsFbItMOL
         TPOA==
X-Forwarded-Encrypted: i=1; AJvYcCW+pXa5gqy8Dmi0vHqcvhMWvI2C/CW5/c2+rD9wJsBi78CxKbl6sOmpudTMZ5e+2laa5LW0sSPi@lists.linux.dev
X-Gm-Message-State: AOJu0YwwgVXv73lMvQTKKmBQ8PjbEV+jSJHubsb1PzJoRNK3lWAinRnq
	hWg8ZSIobraEBFNheTK8t69yf6hy4uIxn1Hj7rJK3SXky7iJ1NEIVeTl/HT0UxToqOQOsl1rdhF
	FUCr1NwhWMtCmmN2Ke09ed1/GIHE=
X-Gm-Gg: ASbGncvgKBRIfR0SO1JSRw2kZKHUFtRwaS2jJGqnYab2WicnMSVPgeBIWvELfLwcA2g
	R/Ad2SGKD6zf36EKZSHmkr3Q48g1/gxYMgFlhvvbNKQQwJOvZd9sU9usWki2DOQW22h6Nj+z/JN
	xlQk2VH9BS
X-Google-Smtp-Source: AGHT+IFYBk+YziZEk93I++dkzEEbDPv17C0AA2w6xghnGW4Zz4shpUZmiwyGABiKGPFGjhTpVLPMBVow9YrGLugSLhU=
X-Received: by 2002:a05:6512:15a9:b0:540:1f75:1b05 with SMTP id
 2adb3069b0e04-5493c57ab8amr5115849e87.19.1740669132707; Thu, 27 Feb 2025
 07:12:12 -0800 (PST)
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
 <91dbba64-ade3-4e46-854e-87cd9ecaa689@ralfj.de> <CAFJgqgTTgy=yae68AE29oJQc7Bi+NvkgsrBtOkVUvRt1O0GzSQ@mail.gmail.com>
 <6983015e-4d6a-44d4-9f2e-203688263018@ralfj.de> <CAFJgqgTJ+GBvdkZf4bPHPoUgJj5ZzENZaLzVV2bnDOEG+3OMtw@mail.gmail.com>
 <7ab2de35-8fc8-42cf-9464-81384e227dba@ralfj.de>
In-Reply-To: <7ab2de35-8fc8-42cf-9464-81384e227dba@ralfj.de>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 27 Feb 2025 08:11:59 -0700
X-Gm-Features: AQ5f1JofZL_Q1A2kDOrsV-NIHTRm574zSmREXnrOEzf8tZhCp6mWng88DDVecc8
Message-ID: <CAFJgqgTeq0Zer8b1Dk0D2Cvo3t5BUTqxh_7OF7eCkLtjmm8Mcg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 2:39=E2=80=AFPM Ralf Jung <post@ralfj.de> wrote:
> > On the other hand, RefinedRust reuses code from Miri.
>
> No, it does not use code from Miri, it is based on RustBelt -- my PhD the=
sis
> where I formalized a (rather abstract) version of the borrow checker in C=
oq/Rocq
> (i.e., in a tool for machine-checked proofs) and manually proved some pie=
ces of
> small but tricky unsafe code to be sound.

I see, the reason why I claimed it was because

    https://gitlab.mpi-sws.org/lgaeher/refinedrust-dev
        "We currently re-use code from the following projects:
        miri: https://github.com/rust-lang/miri (under the MIT license)"

but that code might be from RustBelt as you say, or maybe some
less relevant code, I am guessing.

Best, VJ.

