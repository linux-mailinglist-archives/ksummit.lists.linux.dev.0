Return-Path: <ksummit+bounces-2309-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E54B508D7
	for <lists@lfdr.de>; Wed, 10 Sep 2025 00:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70754E434F
	for <lists@lfdr.de>; Tue,  9 Sep 2025 22:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D965D26CE28;
	Tue,  9 Sep 2025 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hI+APAQO"
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65A22172C
	for <ksummit@lists.linux.dev>; Tue,  9 Sep 2025 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757456691; cv=none; b=jUwSjbagH8DW0o9c6Dg5926sVuMEQfKM5dCnGaMooM9Xu0XKhXjyu8K2FBGGEvPs45r/zwQB2kcneRHe3znrGPP5u4hMQDsMMkl0KF660+kW6ijKnNje9RMR2nfi/Z3RCl1eZ3yfoZb63PRWPgURZ3CXtAAYed719xsg1P72O5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757456691; c=relaxed/simple;
	bh=TC2JZtkw5BkMX3Igl25beU/iUsWSo7CWbRuDpStlv3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsgqDPz3LyHVN0OqrBitgBZBR6T+tIhNSJzQ4OqZQLHoW+xRAbu/1EF1rqTvBRysU4Oz2o0kuVpW9CXZe9OEQ+jczkHzoZjrAltcCUwiEY3vggaRxqYDR8LbmJndFk9mz+sq0AwohYYUMNuHuhiGaaTMVh70pFoGXUfwsTpGjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hI+APAQO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61d7b2ec241so7489371a12.0
        for <ksummit@lists.linux.dev>; Tue, 09 Sep 2025 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757456687; x=1758061487; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=hI+APAQO/P8BoVNTLZe/6i/S4XlAlN1OMZR6kWS4uTtumxysMA8Yz+vdE0pCH2mdX8
         et5DKM1+1VO1+2JWgKw/1Bo4d8SWidyXtOYAByeghNqfH07L2AoevqmkzxgP8F51vnrO
         GuVLiLP9cN+nD4heCWTh0yrNE8mU5jegtUOh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757456687; x=1758061487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=rL1dudPnVtwZXlxvatgrmzioxomuj/58L83BWRDgZU78h+N3Uzdi9wvGTaohFnB9Fv
         Iyx4/Fj4ePSmLYFa4TidERmGdQYYjl2OesenjPmEoQHjKo+KHGelkdQGPO+c5Y3v3Tgy
         QA+OoBgbNZanV9zLVf5NKC0WmFepCG/wcJ+7NdjAGXSKTrPgitCrA+acOfvjE2h+SChQ
         MBIYvDwS28Qo6A6CIK/gvRD9WWX/xJwNJNffNWW5uOCgV+Oz+009SWybWk5eZcjYvu1Y
         UaMY0t2pz8bvkBaLxnX/1W3c2PU4Osp9+Imm9WAjJpjNr8hajvC8KP/pkyIgXj8yfq5E
         Ghaw==
X-Forwarded-Encrypted: i=1; AJvYcCWtiLHNhZFFjyCdYVtcbFXuM49dBBG+kz6WQ4nhnAIWxMQo6gJKih0Ji3oRkNaXXpFgtYDXaKAW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu9Zg2rRrwL/PdEa1rF0qlbo1liUIjZ0ArfauJjVzBFU8BafVZ
	761h6BIAHTYRq5OJmZhq4IFFu0Dd/CXopbEsVRN/sFDD4c8K7oSr5SKvjr7oygzixSn3I9Gjgbd
	LmWFkBg8=
X-Gm-Gg: ASbGnct+mKvfsSZZ1mwjAVfBMkn8NZScNNTaTDOmaRmMo3bLN3z+CDBoJrP/sAof2h7
	t8yecKRNoKllXZ4uMl8iBpbpPztbP+YonhMSS0c+Uu0QMRIpKLjywhSDt/MeM+h7Xi8lJMsgNfN
	YM0Ek7OYw09GQrLgAWG0liGLw/dGN4Fi8LN0IEpICPwZ97M6HKG2PlUDeRAMtKFjQS8RkV1S+hd
	xSfqlalOZ+EBOWgzGnIPyGUcefv6zc0qsBQ6JzCBZEUcIWkGSwoZsharsWbMoTNGwDRr1DMj4iZ
	6WCImhttI+N7W38mBGF9tmvRzVcJc0W/DnDF1VNhFiUskioLVsHDwlS1AAeNOL5RmhdejbESNTm
	cYqF/Azxvj4QbWmuXi5MMWN3nPcq5Ssyr2JQi7Zsk7DX+g6Oazu8A48Vgis8Ug68OhGv67PVHDC
	XeOxeeDBA=
X-Google-Smtp-Source: AGHT+IFfK6TPD9XnYsoYdReR46OeWKeYSmW7wUs0DvH5FZqPxd5PhBJKPNd3oX+LFfCUPLJHt55NBw==
X-Received: by 2002:a05:6402:4024:b0:61c:3c58:7114 with SMTP id 4fb4d7f45d1cf-62377109ce7mr12925361a12.20.1757456687487;
        Tue, 09 Sep 2025 15:24:47 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfef68629sm2154315a12.15.2025.09.09.15.24.46
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 15:24:46 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61d7b2ec241so7489346a12.0
        for <ksummit@lists.linux.dev>; Tue, 09 Sep 2025 15:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXt4sGzncJkIQGVnQLKkeuTFy8GMQT6a/VAgffv+gniyq7pAgBpy7YCOg0e7XpV9a3yNWE5pHpV@lists.linux.dev
X-Received: by 2002:a05:6402:4412:b0:61e:a13a:27b8 with SMTP id
 4fb4d7f45d1cf-623729cb58cmr11071027a12.1.1757456686093; Tue, 09 Sep 2025
 15:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
In-Reply-To: <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 15:24:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyoXbbHUJtrfKhAFeDlVJsB9IiUaRxuYQBQJQyqpHDKK1GQ8JtkX5zx-HA
Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 14:39, H. Peter Anvin <hpa@zytor.com> wrote:
>
> 1 GB systems used highmem too, sadly. And 1 GB was the norm for a big chuck of the late 32-bit era.

Well, while on x86 1GB systems did use highmem, they'd typically not
use very much of it.

IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
exact), with something like 120MB highmem.

So they'd either lose a bit of memory, or they'd use the 2G:2G split.

Or - and I think this is the main point - they'd stay on old kernels
like the ancient museum pieces they are.

I'm not convinced it makes sense to have a modern kernel on a museum piece.

         Linus

