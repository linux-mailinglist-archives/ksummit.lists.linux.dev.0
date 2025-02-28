Return-Path: <ksummit+bounces-2023-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB6A4A463
	for <lists@lfdr.de>; Fri, 28 Feb 2025 21:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6FC3B579B
	for <lists@lfdr.de>; Fri, 28 Feb 2025 20:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97731C54B2;
	Fri, 28 Feb 2025 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1OZLmFa"
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18EC23F38E
	for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 20:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740775725; cv=none; b=GWSQKrZcJJRPBMAzB1RKkf178nwjtpa7d+4VMGmxrJckOpaGvlONResT1ddLikjwqxZWaG58nVFYbiJVk/noYe8cOqrg8O9iTdBy2umEgOmF1lZFNSi4ytyJy8tKkvMO8bQDTrdIZO6UoJS7CEvnj7t/mhaSWEdDG9nAXI3ZfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740775725; c=relaxed/simple;
	bh=xLRRhv95p6chtg6mKNSAQ7vk3lJx6EFuiG6hypbyzI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ms+477zu9WWc60xj+nO7liX21KF915PEwER+1emfJBKFwq/fdK9TXXWQ2PbRkI9xkKS4odr5lgX7NDZx32ZG7lxN3vJRW71z7uUdUJQhLIj65lqwMG3b7JQrjwrYSp0p11AiCWKZuDb4NbyBUqls7XNeBFDjuJvhx0AOIQvEDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1OZLmFa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30a2594435dso35686431fa.1
        for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 12:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740775722; x=1741380522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLRRhv95p6chtg6mKNSAQ7vk3lJx6EFuiG6hypbyzI8=;
        b=Z1OZLmFae2FIkTtShiBzVve+qbsYg7xd2qn9d2jn8w6OqDsSTxv0y6AZrFcR1ioUV5
         3luOzExeipJcSgYSwYBv4zd7OHw7BjR+/0Z2pWQ4MtK+2qySbfMeg1c/jBYhe6zqwdZW
         0av/4IpLw2wo4sLSQoUBypEbC+iNf+yMB7lBdGkI6T9vhNrFIZY75l/nnLOrDc0/Qc/2
         VEjDJzxqaIVfG6bQOOwyZvRezvZ5AllqwQWGSLCPJzfTCursWq2vYD/pcGQ1xpZ7A0/p
         SdHnkgDPWhaGnyaVdpQGLkv+U3PceiBXWIEFDYBBRD22My69jej5s0GHp8OVRt44JUEy
         Vf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740775722; x=1741380522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLRRhv95p6chtg6mKNSAQ7vk3lJx6EFuiG6hypbyzI8=;
        b=ZKox8f308CYOueb5NiQKTq3F8tf0bbCNbANkC2YUaUeYwUbq+YnuAvoYKH2egdcFht
         9/5RhwzF2ahD/enHpS3AuFNTc7cqKz4aNzG2GH2/6WsbGVZzH+HPNhuyMbyil53L5fVM
         8sXD7DIsAa7VcsQsHkJOxz69E644jYKfKxlkPmy+sMMw0tLstzAiehxg82mDO54nN/uH
         uVI9fdHUxaMXaeYL3x0NextMhMgGRCbSjKPu85k+walJR/vXtUPqcWr8NJJLvOSK9qFS
         Zsfk4cTFP27DP7zb0E55uS79h/dNg7FWfbcyko40vpAMWSa7Xz7i1uqju+6jvNVpV6dW
         ttOw==
X-Forwarded-Encrypted: i=1; AJvYcCWlOrrOYHIBk5lNq6RyvHBEMWeExAR/rlmc5UyE4TTjt3cgiv+w0+QKrFQvFiAeDHCDDx4GbknG@lists.linux.dev
X-Gm-Message-State: AOJu0Yyeg0Y5g9v0AVb3Uv0Og1o0rq4a5Zof6U+vR2IPdPEq3ZMrl+/+
	z6Fc1jpKXtgn3m27Cp1ocArEGf9yQ3TnshTdtQ1fZXXt5H/ydcW+EcY651h2XiiDO1WSpqWky2q
	wSqrPsYX67BkKivM2aF4IEsO4+pU=
X-Gm-Gg: ASbGncsOGHjpV0uH+Puh9iBSSEoxZJkm3mpAjNkBHEx+hhm0U+aojH8vrj1SKRwCaQ2
	V0wT4/dkYdEugmMvKZ47Eh2fJ8ajsM4uOOWNhHjvTu/oobgc3F0sXqusjT/8OgsPgEMtZR7hap3
	bFbFlQKSA1V6LNfWfYjSO34WjfmbY=
X-Google-Smtp-Source: AGHT+IH6rfW03h505pJtYaLq3LigS+x8FdWPrdV1OCfRQ6sP/1BmgFjRZAeBYZ80pjuf4xT7C7/qA3qLzMgCCDpjeVw=
X-Received: by 2002:a2e:9c94:0:b0:30b:a4f6:bb3f with SMTP id
 38308e7fff4ca-30ba4f6bfe5mr393141fa.16.1740775721670; Fri, 28 Feb 2025
 12:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
 <f3a83d60-3506-4e20-b202-ef2ea99ef4dc@ralfj.de> <CAFJgqgR4Q=uDKNnU=2yo5zoyFOLERG+48bFuk4Dd-c+S6x+N5w@mail.gmail.com>
 <7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de> <CAFJgqgS-S3ZbPfYsA-eJmCXHhMrzwaKW1-G+LegKJNqqGm31UQ@mail.gmail.com>
 <d29ebda1-e6ca-455d-af07-ac1daf84a3d2@ralfj.de> <CAFJgqgQ=dJk7Jte-aaB55_CznDEnSVcy+tEh83BwmrMVvOpUgQ@mail.gmail.com>
 <651a087b-2311-4f70-a2d3-6d2136d0e849@ralfj.de> <rps5yviwyghhalaqmib3seqj62efzweixiqwb5wglzor4gk75n@oxki5lhsvhrf>
 <20250227221801.63371d19@pumpkin> <smghtqj4gnlo7dxo4t6u74c25e2qukhogsi5fysddputbuwbmg@lwuh2nipypqf>
In-Reply-To: <smghtqj4gnlo7dxo4t6u74c25e2qukhogsi5fysddputbuwbmg@lwuh2nipypqf>
From: Ventura Jack <venturajack85@gmail.com>
Date: Fri, 28 Feb 2025 13:48:27 -0700
X-Gm-Features: AQ5f1JqwFMqYXZDw3MuX3Lz0Q8VpEgT8dOkgwIyBShWuyye0GUdMw3PgkeyZhBI
Message-ID: <CAFJgqgRA3xqt6kBZtsZm11nkg7L=cqJtLovORsvq2FAofZJ0Uw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: David Laight <david.laight.linux@gmail.com>, Ralf Jung <post@ralfj.de>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com, 
	ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:18=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
>
> Those were big breaks.
>
> In rust there's only ever little, teeny tiny breaks to address soundness
> issues, and they've been pretty small and localized.
>
> If it did ever came up the kernel would be patched to fix in advance
> whatever behaviour the compiler is being changed to fix (and that'd get
> backported to stable trees as well, if necessary).
>
> It's not likely to ever come up since we're not using stdlib, and they
> won't want to break behaviour for us if at all possible.

A minor correction as I understand it; Rust is also allowed
to break for type inference changes, as was the case with the
time crate breakage, according to its backwards compatibility
guarantees. Though that hopefully rarely causes as big
problems as it did with the time crate breakage.

Best, VJ.

