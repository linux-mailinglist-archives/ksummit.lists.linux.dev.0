Return-Path: <ksummit+bounces-2327-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC250B523E9
	for <lists@lfdr.de>; Wed, 10 Sep 2025 23:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8AD91659B9
	for <lists@lfdr.de>; Wed, 10 Sep 2025 21:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBD531282F;
	Wed, 10 Sep 2025 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGowG+0T"
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1436331076C
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541378; cv=none; b=s7LgukU4j4KLYf5EcswpK9pniPfOCdGyvw2bVLSQ47tTFNwaVxyHi3ljHBJYz0nq0BfWU3KA+luPtCkojsTt82azcm0WxWKZSND8OWyKmko4Iq4BClCiDLcSITu0KERiQ+o3wdEhFLsPHliHmn0GnHwVE15xXNaW9ykNpiLyugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541378; c=relaxed/simple;
	bh=1K0L7vy0m6oAWABtFjIMxHjGZLkeAdVFiL8lxzfzoUc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=n+B+ICmcQqbfqdjtPJ2bxRvrm1hFb4aO8aOSqsWFNdYOlqv53Wds6h4RKzLhQm9JJgEbeM99oT2TtAXNWq9ifmwtzVCO9WewozjAmNb8V64R6otTCPiKlG+3YnQauNAsKbyPtA7estE6o8H2QjjFJRZymdHzW5oOsjqqu666vXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGowG+0T; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso45347a12.2
        for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757541373; x=1758146173; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=nGowG+0TP1fhosC9BbQRGv+OTHVeFI5pbfXwPxSpgEP+biP1PNOGwjdKhtB9mmd4Ka
         Medkft0ViFinNat6YPCUKnj75uTChaPuA1hDsgf9uZLx357WxjnVle3d4yNE7g+/jMpz
         jZizePBb8Ot6/5plN+N/nIa2l36w4qWjWRfrI44XP4nq6t/13/SLLGvleK/pFswLy0eK
         FjAjbgXegXnoxQhOeYe7gJJQwefDV9wuUquL5UD9IKwSJZu8iw0gJiUjv05zCubiVRFo
         hnZG1MyaSu5JeKoJUYa7FOKHQZzCaoxtR+ZCnAvNuaaZ8W+OkBx91O+UaZHs+I9whrB7
         YnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541373; x=1758146173;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=HXr1CSL5Eoy1p8dEle4v1m1Txsct/uyPbH4diaJjPEsbOY646O91cNtTmTGUxkANmj
         o7la8us/DSNGZlohU4tIuc39yKEzNzK5eNeCqZiWW4oD76MLdCEnY7HpfbYPfps4ovpq
         W7bnW+BkCD6j0EhDuqdGFjV+EP5Gpk5ScUkr5lphth09SM2CKoC1scvMk3YIZNuz5b6c
         fxQZrrAK+PoC7trC0YnlUty+sUK8FB7IVJBOQcDGDG38T3Ln3Zfpq0eK7JSQIf6YcTFR
         EL46vAlIFXYHN5BqSN2cWkC/aAsT16YCr2ipfZyGWXdHm6UfAuJEtG6nEMFe6LDKUQr6
         bkJw==
X-Forwarded-Encrypted: i=1; AJvYcCVqxiaxXALWAUgNjmAgaF0BsD8cXcH5dYcLmvmJKfber7qg/Gujkt6eRVPk0Mc3c2H34CSon3BK@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjx5T9GpN2qkCjbEbBFSQNhkSASpSszt7K/eHedYSeGFubK651
	zXtjEXmPFDx0pDb8xq7Mvsgx1OJX2J24kaY7WoVyFH/Mmq/fU5OzlBhQ
X-Gm-Gg: ASbGnct1hY+FxjoHtivfGeG0n0yKMpYYC6SD5iQAEUW4fqxQg9Zykny/lLKXqr0DiS2
	Y7mvrw3Y1BKYOLkEps3MrjBUYEIC0WTL7QF02Gkt2SIl1V2ZkZfEfFATTcTV6CShekyFAuC7OgC
	b88hskxC5/XUwBeDU1pdOmi1yAs6bXGPA1HHH5pbULpAQb48qhW6YUl70naIYerxwYXemZMmg85
	i7hHdHvDJQyl8YXK7HFA/Cbj/GzlQ9/14th27fgB0RFBsUzvI1cEd8uYhMofIMgV6dyBTIOWJ7L
	/uXPr+fiUGCm7cdw0cwq+6/2Jg2kOA2MkukawncK1V/Moq1nKfC8jNcvjQ+X3e5CyQ72MHa03n0
	P0n/cUbXrKeFLMnzNpSHYjwVMnTFH9uUv+msNdi/voVLIVVpD2t6AqSV8iPiQRMn3uSpyvRn+KG
	F7iQjS0Sw=
X-Google-Smtp-Source: AGHT+IGBsR+U1n4WFqO8g+vB4ERFu4ybrDNCTovC+1KY6W1/R7uSZEcXa89aKrlY6FwBWGiHJP9Ndw==
X-Received: by 2002:a05:6402:50d2:b0:629:c417:ee5c with SMTP id 4fb4d7f45d1cf-629c417f146mr10662130a12.32.1757541373118;
        Wed, 10 Sep 2025 14:56:13 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ebfe0ac03sm69476a12.16.2025.09.10.14.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 14:56:12 -0700 (PDT)
Message-ID: <1206e86e-488c-4c58-9e67-2313a678a5a0@gmail.com>
Date: Wed, 10 Sep 2025 23:56:11 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: richard@nod.at
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 dave@sr71.net, david@redhat.com, geert+renesas@glider.be, heiko@sntech.de,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 rppt@kernel.org, sergio.paracuellos@gmail.com, surenb@google.com,
 vbabka@suse.cz, willy@infradead.org
References: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> In the past I saw that programs such as the Java Runtime (JRE) ran
> into address space limitations due to a 2G/2G split on embedded
> systems. Reverting to a 3G/1G split fixed the problems.
Believe you guys are talking specifically ARM so FWIW, but I remember 
for x86 that at least initially Wine and things such as VMware were 
affected by the more creative PAGE_OFFSET choices.

Both will have been as a matter of plain bugs and are supposedly long 
fixed (and I in fact believe I recall such fixing for VMware). Never had 
or as far as I recall heard of other issues back then.

Rene.

