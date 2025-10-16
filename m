Return-Path: <ksummit+bounces-2544-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057CBE2174
	for <lists@lfdr.de>; Thu, 16 Oct 2025 10:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57EE742562C
	for <lists@lfdr.de>; Thu, 16 Oct 2025 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821632FF176;
	Thu, 16 Oct 2025 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vam7o+cv"
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712E1D5151
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602141; cv=none; b=JR3jD8aLoZm7pq7fDIaQxzBt8IkpTxMMPiTpFBl0Tr7Sb09GPoINTcVgO3YILgxY3veRaKrpDv2lyjJdN1GTaVp2N+wXT8Fo8FHsgo+jVcLHohNl+dE9QisUg0dCDsdB/YbT68y0AQfxGqSyTYWkHvwcgcv16tOPgC4/BAhZK78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602141; c=relaxed/simple;
	bh=1Uj1+kT9Ncnz+pUZCTIS3+KO/AATjEifD2hlvIE6J6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds0OypFi2ybp7NjPHHRpl44lvd7adc5Wty9Al0cry8nUOBI+C94yXVMu8T7SSL7RIyaJxP9jMeggtjjiun7Ltw7GrIa30USBimz4iEET00iYiL+zcTxZOZmO2UCIVxnrmK7bfexo54ltvb2o8lOUe9HYUrYwLhguWgnff3blfog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vam7o+cv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so294977f8f.3
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760602138; x=1761206938; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWFY/I0+JOmGr+ltIRfyHOGBWZXLIQpSi7lo+jDVF6g=;
        b=vam7o+cvtqJp7flN6HXKUD5woV3L17knqr1BnnVFY/cn4GmEeb495cRmFWdObvyik3
         V0iWJY7PB4xpndGsFoOI/D+sPfFjGKpaN41oKMxBM7lklHEIpju1HSjC2k/Lt+ffcpe7
         d8xTE8x8ATiSOjWWORnvWopPvCV1maBhBadMWW0gAJhWJh0XJznRkqsS88kuRxYC0cFA
         xSUmAVhKza5NxjlYyHBMaCKJPwwxLlyAhVqPgYJC2BAMQmhXYVjWNTPfzMEn7dH9oCq8
         3bOnkH/7mcHbCd9sXfoaE1UBMwUWxAojzkJqRYQtsRrDqajqVNYQ0bbl4NRpl+B7RYSI
         CfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602138; x=1761206938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWFY/I0+JOmGr+ltIRfyHOGBWZXLIQpSi7lo+jDVF6g=;
        b=qKr6Mm7lsN35miVjiDSRpaNBY+q2LvmucfKznheQHAiO6NbGiSxinIdxTynLStXcOX
         kMaueQTF5AYrpc882ahq0C8PTvZtuNm8B5Xlf5ZCIX52p/JvkZnIiMqkycBJWH/aQSu6
         pjFbVcAJSCTeHQ3BpFLZayH3KwgHY0pPSV67ijdaXh93+gInK/U6pMXg0VHostCoheXI
         qJF75yOBWwEs+5IO0JBSlg9bNngRkVUHu+MbCQ9B0qEmfHZmvkSizXkZFKR+hRXjasbA
         +2x9TL4fhZUJIwUJZFBEgHd1ptSpHr4zIux3iqd3nxM9TAz3FOzCAP0JWWb56qwwWU8P
         810g==
X-Forwarded-Encrypted: i=1; AJvYcCUamFLqX9M+KbR6KG3OsLp1aLEMzbtvRRAeH/djT6HG6sn3oO0++ltzAixuohHjM058eYkc/3xt@lists.linux.dev
X-Gm-Message-State: AOJu0YxNpcHCAs7s1qYNHsqvcFx101AHJkMSbxn+wvEz7oMrIqYPa+AU
	KnzfrSPHZdvKlbgDfEywck0LuVhhSzMB3ts4vMdkHb/cQCaZEVg5aciGlVmfGmlfdZo=
X-Gm-Gg: ASbGnctZQCq9iTxgeZFZ8JSBJh+5WVYNsqB7lJDeRFa1wfG0m+KHPrBsAnLubBefH7P
	LWClpCR9l+fFR4y7JAitDdMXWRKdi+y9KgFAp+OzE+XkJfxD80xiWsr3VOuLVF2dRrOT6wmxscJ
	CfjepsCoe0odMWudV00aAuHggykDIyvSg7Qv1abrtOaq2KIT/hK4e7DwHBj9r2JaG+C7UF3nKCv
	ngDgV8FyMpF9nGHi70ZuIa5SjwNqXVgqELtpLQpMzihs/tYSkVZSoCwsEFAxPCQwXi/JlhnJdha
	Zs0l+4U0kcsfj6BKkftZxUHUudVlpl4m/cs/qE89V2n+6t3QMuQ70df++WWhAgHnMHoR4gNZeoz
	v+cjAg9a4AVOFjX/qFZ8Zu+b4MQ+1CcqvihYrrIi536pu32ot/w/QOHkagy4Z2hdj4lTzPZLnGs
	4wEuF++XpOO/XXp/WiyFBc
X-Google-Smtp-Source: AGHT+IGXMRU53rW39loJe/2tm/NjvTgYsE5zALHmkYLWkBTKuYUAZvGjJ7maKuUfcqezrEb2jTu1pw==
X-Received: by 2002:a05:6000:26c3:b0:3e7:6418:247b with SMTP id ffacd0b85a97d-42666ab2959mr18744621f8f.10.1760602137434;
        Thu, 16 Oct 2025 01:08:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144239f4sm11373555e9.2.2025.10.16.01.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:08:56 -0700 (PDT)
Date: Thu, 16 Oct 2025 11:08:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <aPCoFSXzXofB7p-2@stanley.mountain>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
 <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>

I cloned the latest b4 to get dig.

Why does everything go to stderr instead of stdout?  There is a lot of
debug output so I think it's still in the demo stage?  Personally, I only
want the last version of the patch which was merged so I have to pipe it
to `grep https: | head -n 1`.

I did a test to see how well it works and it works 88% of the time.  Here
are the results from 100 digs where you can see version number bumps
aren't sent to the list, parisc and some ceph changes don't through lore?

regards,
dan carpenter

3a8660878839 ("Linux 6.18-rc1")
a8482d2c9071 https://lore.kernel.org/r/20251011103153.2354-1-wsa+renesas@sang-engineering.com
54b91e54b113 https://lore.kernel.org/r/20251011112032.77be18e4@gandalf.local.home
fd6db5886792 https://lore.kernel.org/r/20251011-null-barn-fix-v1-1-5fe5af5b8fd8@suse.cz
bda745ee8fbb https://lore.kernel.org/r/20251011194257.174203652@kernel.org
b0f2942a1601 https://lore.kernel.org/r/20251010-kbuild-fix-mod-device-syms-reloc-err-v1-1-6dc88143af25@kernel.org
ce740955b238 https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engineering.com
f7045387a681 https://lore.kernel.org/r/20251009111500.75198-2-wsa+renesas@sang-engineering.com
9338d660b79a https://lore.kernel.org/r/20251008-kbuild-fix-modinfo-regressions-v1-3-9fc776c5887c@kernel.org
8ec3af916fe3 https://lore.kernel.org/r/20251008-kbuild-fix-modinfo-regressions-v1-2-9fc776c5887c@kernel.org
4b47a3aefb29 https://lore.kernel.org/r/20251008-kbuild-fix-modinfo-regressions-v1-1-9fc776c5887c@kernel.org
accb9a7e87f0 https://lore.kernel.org/r/20251008102628.808045-3-kafai.wan@linux.dev
4f375ade6aa9 https://lore.kernel.org/r/20251007012235.755853-2-kafai.wan@linux.dev
07ca98f906a4 https://lore.kernel.org/r/20251008165659.4141318-1-aleksander.lobakin@intel.com
b30c32c784bf ("cifs: update internal version number")
dc6b72497401 https://lore.kernel.org/r/20251010131058.69778-1-robh@kernel.org
b5f8aa8d4bde https://lore.kernel.org/r/20250924-gpio-shared-v1-1-775e7efeb1a3@linaro.org
a29ad21b9886 https://lore.kernel.org/r/20250829175152.9704-2-daleksan@redhat.com
207696b17f38 https://lore.kernel.org/r/20250918193019.4018706-1-jarkko@kernel.org
8a81236f2cb0 https://lore.kernel.org/r/20250915182105.6664-1-gunnarku@amazon.com
64a7cfbcf548 https://lore.kernel.org/r/20250731215255.113897-3-ebiggers@kernel.org
2c2615c84238 https://lore.kernel.org/r/20250731215255.113897-2-ebiggers@kernel.org
4bddf4587c13 https://lore.kernel.org/r/20250825203223.629515-1-jarkko@kernel.org
fa9fe8715055 https://lore.kernel.org/r/20250831123602.14037-17-pali@kernel.org
92210ccd877b https://lore.kernel.org/r/20250107002311.28954-1-pali@kernel.org
88cae132dc05 https://lore.kernel.org/r/20250107002311.28954-1-pali@kernel.org
057ac50638bc https://lore.kernel.org/r/20250608170119.6813-5-pali@kernel.org
15df28699b28 https://lore.kernel.org/r/f91c6079ef9764c7e23abd80ceab39a35f39417f.1759964186.git.fthain@linux-m68k.org
f4edb5c52c93 ("parisc: Fix iodc and device path return values on old machines")
44ac7f5c6d4c ("parisc: Firmware: Fix returned path for PDC_MODULE_FIND on older machines")
9db26d5855d0 https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-6-01286ecd9f3f@geanix.com
1502fe0e97be https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-5-01286ecd9f3f@geanix.com
e0762fd26ad6 https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-3-01286ecd9f3f@geanix.com
9ffe06b6ccd7 https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-2-01286ecd9f3f@geanix.com
795cda8338ea https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-1-01286ecd9f3f@geanix.com
7ae6152b7831 https://lore.kernel.org/r/20250929132805.220558-2-ematsumiya@suse.de
be3898a395f8 ("smb: client: remove redudant assignment in cifs_strict_fsync()")
dba9f997c9d9 https://lore.kernel.org/r/20251007192326.234467-4-pc@manguebit.org
b95cd1bdf5aa https://lore.kernel.org/r/20251006190854.103483-3-pc@manguebit.org
57ce9f7793b7 https://lore.kernel.org/r/20251006164220.67333-2-pc@manguebit.org
110fee6b9bb5 https://lore.kernel.org/r/20251006190854.103483-1-pc@manguebit.org
0cc380d0e1d3 https://lore.kernel.org/r/20251005064952.4056-1-wangfushuai@baidu.com
68d2e2ca1cba https://lore.kernel.org/r/20251004021143.230223-1-henrique.carvalho@suse.com
1643cd51ba97 https://lore.kernel.org/r/7a5c4b6d-f15e-4071-8a82-dca6b71b6b4b@web.de
eb4faf634388 https://lore.kernel.org/r/20251004154808.116143-2-dev@kael-k.io
434689e97195 https://lore.kernel.org/r/20251001212416.4871-1-hansg@kernel.org
fea8cdf6738a https://lore.kernel.org/r/20251008-airoha-loopback-mode-fix-v2-1-045694fe7f60@kernel.org
5d683e550540 https://lore.kernel.org/r/20251003233025.1157158-10-kuba@kernel.org
fbb467f0ed95 https://lore.kernel.org/r/20251007232653.2099376-9-kuba@kernel.org
0be740fb22da https://lore.kernel.org/r/20251003233025.1157158-8-kuba@kernel.org
2eecd3a41e67 https://lore.kernel.org/r/20251003233025.1157158-7-kuba@kernel.org
27ba92560bcc https://lore.kernel.org/r/20251003233025.1157158-6-kuba@kernel.org
1ad3f62089af https://lore.kernel.org/r/20251003233025.1157158-5-kuba@kernel.org
858b78b24af2 https://lore.kernel.org/r/20251003233025.1157158-4-kuba@kernel.org
613e9e8dcb7e https://lore.kernel.org/r/20251007232653.2099376-3-kuba@kernel.org
7e617d57f2a2 https://lore.kernel.org/r/20251003233025.1157158-2-kuba@kernel.org
6bb73db6948c ("crypto: essiv - Check ssize for decryption and in-place encryption")
64cf7d058a00 https://lore.kernel.org/r/2025101305-harsh-moisture-93ae@gregkh
de4cbd704731 https://lore.kernel.org/r/20251008172516.20697-1-ankitkhushwaha.linux@gmail.com
d74d6c0e9895 ("ceph: add bug tracking system info to MAINTAINERS")
a154f141604a https://lore.kernel.org/r/tencent_8C54420E1B0FF8D804C1B4651DF970716309@qq.com
22c73d52a6d0 https://lore.kernel.org/r/20250729170240.118794-1-khiremat@redhat.com
c66120c84295 https://lore.kernel.org/r/20250902190844.125833-2-slava@dubeyko.com
98a2850de49c https://lore.kernel.org/r/20250828184441.83336-2-slava@dubeyko.com
6140f1d43ba9 ("libceph: add empty check to ceph_con_get_out_msg()")
7399212dcf64 ("libceph: pass the message pointer instead of loading con->out_msg")
59699a5a7114 https://lore.kernel.org/r/20250806094855.268799-2-max.kellermann@ionos.com
fbeafe782bd9 ("ceph: fix potential race condition on operations with CEPH_I_ODIRECT flag")
53db6f25ee47 https://lore.kernel.org/r/20250708192057.539725-1-slava@dubeyko.com
5824ccba9a39 ("ceph: fix potential race condition in ceph_ioctl_lazyio()")
5b2d1377d6cc https://lore.kernel.org/r/20250606190545.438240-1-slava@dubeyko.com
1ed4471a4ee6 https://lore.kernel.org/r/20250606190521.438216-1-slava@dubeyko.com
b7ed1e29cfe7 https://lore.kernel.org/r/20250606190432.438187-1-slava@dubeyko.com
fa073039466f ("ceph: make ceph_start_io_*() killable")
27c0a7b05d13 https://lore.kernel.org/r/20250731190227.16187-1-ebiggers@kernel.org
c834a97962c7 https://lore.kernel.org/r/20251013144429.966496922@linuxfoundation.org
4f7bf54b07e5 https://lore.kernel.org/r/20251009152420.751067844@kernel.org
f0c029d2ff42 https://lore.kernel.org/r/20251001130907.364673-2-thorsten.blum@linux.dev
e9a9dcb4ccb3 https://lore.kernel.org/r/1b3a55134d4a9a39acab74b8566bf99864393efc.1759914262.git.asml.silence@gmail.com
09cfd3c52ea7 https://lore.kernel.org/r/b0441e746c0a840908ec3e3881f782b5e84aa6d3.1759914280.git.asml.silence@gmail.com
455281c0ef4e https://lore.kernel.org/r/20251007181205.228473-1-pedrodemargomes@gmail.com
deabb34b66b9 https://lore.kernel.org/r/20251002155423.466142-1-thuth@redhat.com
e84945bdc619 https://lore.kernel.org/r/20251008125942.25056-5-fw@strlen.de
a126ab6b26f1 https://lore.kernel.org/r/20251008125942.25056-4-fw@strlen.de
bbf0c98b3ad9 https://lore.kernel.org/r/20251008125942.25056-3-fw@strlen.de
f359b809d54c https://lore.kernel.org/r/20251008100816.8526-1-fmancera@suse.de
229c586b5e86 ("crypto: skcipher - Fix reqsize handling")
c7866ee0a9dd https://lore.kernel.org/r/20251005023335.166483-1-marek.vasut@mailbox.org
2c95a756e0cf https://lore.kernel.org/r/20251006204029.7169-2-thomas@wismer.xyz
e475fa420e6c https://lore.kernel.org/r/20251006115640.497169-1-arnd@kernel.org
f52ce0ea90c8 https://lore.kernel.org/r/20250926162034.1785899-1-yang@os.amperecomputing.com
28bba2c2935e https://lore.kernel.org/r/20251003155238.2147410-1-ryan.roberts@arm.com
f04aad36a07c https://lore.kernel.org/r/20250930063921.62354-1-acsjakub@amazon.de
b93af2cc8e03 https://lore.kernel.org/r/20250930004410.55228-1-sj@kernel.org
9658d698a8a8 https://lore.kernel.org/r/20250930081040.80926-1-lance.yang@linux.dev
1ce6473d17e7 https://lore.kernel.org/r/20250922021458.68123-1-lance.yang@linux.dev
fcc0669c5aa6 https://lore.kernel.org/r/20250922220203.261714-1-shakeel.butt@linux.dev
90eb9ae35727 https://lore.kernel.org/r/20250917174033.3810435-5-rppt@kernel.org
a667300bd53f https://lore.kernel.org/r/20250903063018.3346652-2-rppt@kernel.org
8375b76517cb https://lore.kernel.org/r/20250917174033.3810435-3-rppt@kernel.org

