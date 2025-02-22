Return-Path: <ksummit+bounces-1850-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C65A40BAF
	for <lists@lfdr.de>; Sat, 22 Feb 2025 22:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C796C161CFF
	for <lists@lfdr.de>; Sat, 22 Feb 2025 21:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C3920468B;
	Sat, 22 Feb 2025 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hWXbAFeA"
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F62045BC
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740259377; cv=none; b=V39s2ZL05kCs3hGySR8ISfxECu1VW69PQ1r+beHxvWXunVV0NP64/WtVF9qnTyh6HA82nZi/LAvVQ9Ho8kMxJZuHDRHNrvjywsrc9lJNI2N0rekHEmaSjU0jY9HNecvi4m8HY2FK//QFw72O/2HqJCACNvnfKq4te0G+fQJqWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740259377; c=relaxed/simple;
	bh=wksg7Ssp0B5fCpUThY7XyozB7dKQo0DeSRiYBXMj6os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+rD2R51k2Pl2dfUaiS6JtTX6JENoAWAwnrrawrQ26FtsDtFSPH19DxtD0ntwpEJ/ygjYJp2Xu2NMQoJwAf4Mbg2yWze0xLQmGElJVYH3VgVC9LqtnZ15y1vuTRa6msV6jWU2c0S6lghfeCO2CkI5Wt/280Nqxvc/0b5Qlf7hys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hWXbAFeA; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbda4349e9so465722766b.0
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740259372; x=1740864172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iEhhaz8KH8wSaw5vdKbNXgznw8OSlCEKiD6GpJBrEE=;
        b=hWXbAFeAAnJvnq5vb2Gc1lQxqafORDqYQG6PCmnkTVbPu2i40QmpTMEEN+StBq7r4b
         Ajh5T7g/8eVH7mFVCv82csqMun6YlddFeL2SKamoCCx+6LGhhOBvBPMUMRq8yAH1FYR5
         pyqYBQ+nfU1dZlF9Hnb+Bj6vWQ/2L2ngK4qCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740259372; x=1740864172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iEhhaz8KH8wSaw5vdKbNXgznw8OSlCEKiD6GpJBrEE=;
        b=iy+EhLMVX0Z+Lr6QMpR99YsuTkYIYV2ZEGpqQi7WPxlvYKCb9EXA0PKfP26UjS1kvU
         13Dbin4NTe2Jjj7WE9R64TZCpiyOX+PNHo3jZCY4KVC3sRXjekRPvwgKNjNhepsYLHQC
         pmhiI5my0vuFC0cR/e//nZWOTRsXiP0JLcQ01dSrZwpXBre9Daq3Y/+MexhG0NU9chYZ
         eKHCyZXW3UjmWe+tOun6BklFxsSj9NCba1v/QCMUa8Tt3zl6BFoC3TmnGqawbaSRVkLc
         v+SxCMjRyekQ4Ta9AJhdyuywdyOBGwZJgngin8bcC2+8icOdNVySuaSWYlWuoL8u5jkA
         t1ew==
X-Forwarded-Encrypted: i=1; AJvYcCX2JPNe453h27HsPeK6KjrQlqkSycCKCaOSb/Yarbc3vXt1AtYvK2aPbcOQMgmdZSEd1JIUkoa5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8O+iAtI1d+wmNEyrgE/y1LB8J0Kq+WnSwMTnbtVY1VVmIsodR
	IBAndvJ1H/cWBhHi0W8Do/IQRUSyRtDJDf08M4LA0jzEzQIGKzIwTvrZDQnPpwtXdnO8E6suukI
	yRVg=
X-Gm-Gg: ASbGncvu6gcLTX3E1wfpzBa+qmA1ORaIFDj908/cA1SQo0DylUQd8kZ+mrfhAuyKKkP
	mURNkzyKXUgBeFU9MYGHvFE7UvUVXv32OakgI3+SO7fevAvPkWzAgvvHu4/wzodlOgVkIJy5ThD
	2NPHvmLWm8EJ2WUXfoU+J5NSOpndIstyt6mTCBUuc1dvbwum1GLVVQUMh92hklahruUP4dkLP3Q
	dQmEs6tW9Xrrvg98N6wPhVQiFumu6qYIBI3R6QcRop7NoACCS3kC0KL6vn0ndL3U2H3TbOwGMk2
	9Snp2svzMFH3caIhtquYA7QvzOe4yJ9gers8B94pTm3i3LbPEpaMlOS7/EtC7P0OUhGIvl0ma+5
	A
X-Google-Smtp-Source: AGHT+IHvy9SXQEWYznrE+urgf8q3iKoAhg2UhMvHPtv8AiutY/hTChJoGplQP3hVZnosxmyaX7KIcQ==
X-Received: by 2002:a17:907:3f8e:b0:ab7:83aa:b19 with SMTP id a640c23a62f3a-abc0de0e4a9mr860263566b.42.1740259372264;
        Sat, 22 Feb 2025 13:22:52 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7e29be33sm1476749366b.94.2025.02.22.13.22.51
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 13:22:51 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso4490448a12.2
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 13:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXymBmLB0WCHsskKUu+hpM4mQ+FemdIblnGSrgXJrRDjOiRy+T2sLjFKzppyVc5/LxmSeVKIqDm@lists.linux.dev
X-Received: by 2002:a17:906:6a02:b0:ab7:b9b5:60e7 with SMTP id
 a640c23a62f3a-abc0de0dfbfmr702171766b.40.1740259371241; Sat, 22 Feb 2025
 13:22:51 -0800 (PST)
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
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft> <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
In-Reply-To: <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 13:22:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjS8hzLyOEAxhHR3miajBHdXXSpyhq54iCb6dKuJxP4Yw@mail.gmail.com>
X-Gm-Features: AWEUYZn2q7vlrnil44LrRbnQ_gYsOI4ICZfisQzq90rI5rzF1ykDwwh3NLl2oAo
Message-ID: <CAHk-=wjS8hzLyOEAxhHR3miajBHdXXSpyhq54iCb6dKuJxP4Yw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025 at 12:54, H. Peter Anvin <hpa@zytor.com> wrote:
>
> VLIW and OoO might seem orthogonal, but they aren't =E2=80=93 because the=
y are
> trying to solve the same problem, combining them either means the OoO
> engine can't do a very good job because of false dependencies (if you
> are scheduling molecules) or you have to break them instructions down
> into atoms, at which point it is just a (often quite inefficient) RISC
> encoding.

Exactly. Either you end up tracking things at bundle boundaries - and
screwing up your OoO - or you end up tracking things as individual
ops, and then all the VLIW advantages go away (but the disadvantages
remain).

The only reason to combine OoO and VLIW is because you started out
with a bad VLIW design (*cough*itanium*cough*) and it turned into a
huge commercial success (oh, not itanium after all, lol), and now you
need to improve performance while keeping backwards compatibility.

So at that point you make it OoO to make it viable, and the VLIW side
remains as a bad historical encoding / semantic footnote.

> In short, VLIW *might* make sense when you are statically
> scheduling a known pipeline, but it is basically a dead end for
> evolution =E2=80=93 so unless you can JIT your code for each new chip
> generation...

.. which is how GPUs do it, of course. So in specialized environments,
VLIW works fine.

          Linus

