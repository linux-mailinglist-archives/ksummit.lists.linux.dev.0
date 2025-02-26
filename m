Return-Path: <ksummit+bounces-1954-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9887EA46C84
	for <lists@lfdr.de>; Wed, 26 Feb 2025 21:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9562416ED7C
	for <lists@lfdr.de>; Wed, 26 Feb 2025 20:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BA9235377;
	Wed, 26 Feb 2025 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="TSR/utGr"
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2019E98C
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602100; cv=none; b=AEQGYzmWcF3mZtaNrPHMnvXpg7k4VfTx9K9AVStCpBHoLhkLtLd3u9j9tVLp4j0TqjNn0Hat11zSNv+Rzq7nAwgf9vq7KPLbdbjqDAm6iPkVaWkHjE0YbUlS0GCKnUsU89+RurkxTKlzKqGhBDLwYeY38R64xFsAoXti1roxE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602100; c=relaxed/simple;
	bh=BsjkObCZOGJxyJ1E4M58vXDesam1iaUd49yxo0CQgKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irIB5eH+rnwOsJyj1VETmiRnHTqRHc8tNco67Or1oQIpMCLqA167mSrFEeOJFGb7Y9/ZItJWswGjXi+x1Y4HcobHGzGGPTmA8NB3BYu6dggduSbJ/PYMIzz5KPjjYaMd5+Hv029sI9++vF4PkBFD0YzEoMakHZKEC/yfcVOMhAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=TSR/utGr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso26105566b.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 12:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1740602096; x=1741206896; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNNBNCG63y+hw99CeSG36gYBSbxZTQ5PMbvNbhu7Ucs=;
        b=TSR/utGrFKcoNxRzAJLb3dcPEgx8OOWwCf1yq2LOqClSUSKpYMhsxy0PitZ5Pz5+Iy
         2uD80wEmdQOo3SsfADGnRAAkRA/3uGtRso8ETLC0quNdo43mJIfcUhwDLs0bvIoMU9n9
         K6IgnAUPeRjhzJc6OUYr2nmDSwyQ2eViCiPFC51nX9yv6UJqlJhlZzreGmDbqDpuHyE/
         sTqyBLKXlOarLEpArNou7t4byAYnVO64FmxakYHQ4vESNN/+S2u+gfZLBP7jkM6kNrBj
         u4boX89YjOVuVmueoemMXm14m2a55bGMFq9otNQwpak6pUnleo/SCmP5SbvOn3qKkV0n
         cZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740602096; x=1741206896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNNBNCG63y+hw99CeSG36gYBSbxZTQ5PMbvNbhu7Ucs=;
        b=iABe5Vfk1zqK6JHMCSf0Ccn/7UeUI34KAyFQjySFQepp5J7QeWy4rq0pud/Z0dJ1KH
         tQWWXQgW0+g760FnHmt+LjiB5tGHo8rYRsY4fM66ruvW4n3ntXlYF7AlsApRVmuXzqmK
         HXkzxK5sAK1BHZBjh2MCrF2ZD6ZHSV0YGY/h+Ta6v2B6mkKYLmlolor5TTomJRzTqweN
         +7/0aXAX9Cye+OfBWCTG5jXzOtqm8gn2j6Q1Y7GhHx7HslliKaGcx+3hIDj2iROcU6tW
         /Aa4FrJlmHxboqF5TWyfCWl+cLuXdhm3Iapyu7v/Wjfi1kiKF+0MbzEhXECIRSHxRPyA
         E1qg==
X-Forwarded-Encrypted: i=1; AJvYcCUJrEoMutuvJWMmjzJG5uzbdnu5SBRG7EPjgSmKeZsuG6/0L70Wdl1B+NSoomg5FI74kBtsJ9Hs@lists.linux.dev
X-Gm-Message-State: AOJu0YylJ6b+6nlnBW+SXtopSHgoI0JcFpoJJNidQQACfL1r342czYcM
	6DvHKWcLol7AyqthjrJoNMlswQ9nY5OXqF1FLH5mU8+n4iGUNQ8VO1Nk4dM9ElwQmzez5izTVz+
	evBB0thAoimsUZ1hTmBDmPA0XJuyB5YWswChf
X-Gm-Gg: ASbGncunlWhG6QJ8y83cone3OeUGr1ZcEsaLHmUtC0kQ89wzdDMOhrjJ0/P+XXyUmY9
	SHUJW3RaX/OsL4REAR/sblUFwVCrWFcwU8m74inTHkpyVIOxNPUHvzwxvfWDm6gN8hvygAyikQb
	9wG0RExw==
X-Google-Smtp-Source: AGHT+IEpD0bL4v9cVqbM+mXKhEESXlvA+VH0GzcrSUQIWZvKuDazTin9u4dr6k0WDBAgoL9Etj8BS5SONGwDZcdL8eM=
X-Received: by 2002:a17:907:c29:b0:ab7:86ae:4bb8 with SMTP id
 a640c23a62f3a-abc09a0bc37mr2387353166b.23.1740602096179; Wed, 26 Feb 2025
 12:34:56 -0800 (PST)
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
 <amebiomyty3gw7gwgpz3sbztzdac6ce2pslq3jjfe3no4w72dn@sskvzdp6l67w>
In-Reply-To: <amebiomyty3gw7gwgpz3sbztzdac6ce2pslq3jjfe3no4w72dn@sskvzdp6l67w>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 26 Feb 2025 12:34:44 -0800
X-Gm-Features: AQ5f1Jq-YVyDssbhA7TUSjB18AyuOEnmF5EUBN1uZ8DJs3k5rbz-GioqT3VdMt4
Message-ID: <CALCETrVc_eBjBSPy=nLHP7fh5h52u_wdT2YRnUZJDWmr-C2q_Q@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ralf Jung <post@ralfj.de>, 
	Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:27=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:

> E.g. if you're doing a ringbuffer with head and tail pointers shared
> between multiple threads, you no longer do that with bare integers, you
> use atomics (even if you're not actually using any atomic operations on
> them).
>

FWIW, as far as I'm concerned, this isn't Rust-specific at all.  In my
(non-Linux-kernel) C++ code, if I type "int", I mean an int that
follows normal C++ rules and I promise that I won't introduce a data
race.  (And yes, I dislike the normal C++ rules and the complete lack
of language-enforced safety here as much as the next person.)  If I
actually mean "a location in memory that contains int and that I
intend to manage on my own", like what "volatile int" sort of used to
mean, I type "atomic<int>".  And I like this a *lot* more than I ever
liked volatile.  With volatile int, it's very very easy to forget that
using it as an rvalue is a read (to the extent this is true under
various compilers).  With atomic<int>, the language forces [0] me to
type what I actually mean, and I type foo->load().

I consider this to be such an improvement that I actually went through
and converted a bunch of code that predated C++ atomics and used
volatile over to std::atomic.  Good riddance.

(For code that doesn't want to modify the data structures in question,
C++ has atomic_ref, which I think would make for a nicer
READ_ONCE-like operation without the keyword volatile appearing
anywhere including the macro expansion.)

[0] Okay, C++ actually gets this wrong IMO, because atomic::operator
T() exists.  But that doesn't mean I'm obligated to use it.

