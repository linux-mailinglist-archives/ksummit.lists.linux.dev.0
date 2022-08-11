Return-Path: <ksummit+bounces-765-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A316F58FC70
	for <lists@lfdr.de>; Thu, 11 Aug 2022 14:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F09280C18
	for <lists@lfdr.de>; Thu, 11 Aug 2022 12:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECBC3233;
	Thu, 11 Aug 2022 12:36:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF22F3B
	for <ksummit@lists.linux.dev>; Thu, 11 Aug 2022 12:36:48 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id o15so27959115yba.10
        for <ksummit@lists.linux.dev>; Thu, 11 Aug 2022 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Yb3bqxvmYpN3It9rt86LXTh1FRjFGyWt1v74tl/UbCQ=;
        b=PBLh1H7XodJF015l8zKNg89frFWKw6IBkZ8qWR7FjmK38j1Nb4e2+Gjf3ge9K6QEme
         zZZL0LCXAWScCrO/VP+AVQAQexbGeX5YuiHamlOGG5SIdikdR7rwJ9qWmD0UADhF2Yy0
         TpNc1aa/xojBcgZyKeafAvV2Q33SAM3tSmSX2hjRnnJ1tzWVE4KEEfR4eqbOROwPGQps
         WMIhpX5GalTJ1+1ohvCPPZA/sxYcfVerwTng66/0FQHCCAAB8jsft/DCKxTdTN44sOMt
         KQbiJnwaKso3cKdy8NWQlCKSLn/srCBvKESIf71MUX7Xh/YugR7fu6X6nxHtYk96cxmB
         MluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yb3bqxvmYpN3It9rt86LXTh1FRjFGyWt1v74tl/UbCQ=;
        b=z+qXjleRE+tLBG9xq9Zs50i6N4InEcWxkwXdreqSIAGD5Fv3a0yNnYj9A6242+SUXT
         9OdQ428lz8HaV7J0H5gAdgfuFjrG/BzIUaO2fjU8beVrcWfAtxREwcggEmUelkvyCUS9
         9QDo5i5CBj8ra7aZlNRAmN3Hy5vyoQtSxOCLzuKvN/CGwYOmG/0ENoOgZ9DUT5YGjBtu
         6AQEPH9kE/sX8rmbeIlh0Q7rQUKzM2Wy8BA+WT7AO2Odbob5QCQF6/sjwfaIHv4jLFVM
         jhXjyErfm3UXXdolW0EhKQXfbDd3oTkx/cpCgPWXWom6XVHE+nSNT/vsoeaBCnHpFO/Y
         3MmQ==
X-Gm-Message-State: ACgBeo0RyDPUzzV4ZE+iiJy8ZJYCFeI8wMFRYzgAn+0bxQc/r/AtyL3f
	W1FeOjcjYoU5FRHkxzMwcXwVMFalBKXO8qeJZyc=
X-Google-Smtp-Source: AA6agR4ia2xSznFHVcopbKCGio7v3IvfWKUU8P5BJzq6RjYbnobzWWeBm8MvU5r18hzB9PhOBVKET31KaTdjopSk4vI=
X-Received: by 2002:a25:8101:0:b0:676:c7fd:2143 with SMTP id
 o1-20020a258101000000b00676c7fd2143mr27582457ybk.364.1660221407133; Thu, 11
 Aug 2022 05:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
 <YvO6LY3kE02/uvXe@sirena.org.uk> <CAL_JsqJH41LZQvtiJMn_70FQLzjq=8aNOX3qymjPf6+0rwxodQ@mail.gmail.com>
 <YvPCTMruRsG0vkSe@sirena.org.uk>
In-Reply-To: <YvPCTMruRsG0vkSe@sirena.org.uk>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 11 Aug 2022 13:36:10 +0100
Message-ID: <CADVatmOd0H3SgOHvF=iiC3GGF5+4mtQv0FPotvbZ1z_89QR2Ow@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robherring2@gmail.com>, Lee Jones <lee@kernel.org>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Lee Jones <lee.jones@linaro.org>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 3:36 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 10, 2022 at 08:20:32AM -0600, Rob Herring wrote:
> > On Wed, Aug 10, 2022 at 8:01 AM Mark Brown <broonie@kernel.org> wrote:
> > > On Wed, Aug 10, 2022 at 07:54:59AM -0600, Rob Herring wrote:
>
> > > > You've got to filter out what you want on your end. And lei is great
> > > > for that.
>
> > > lei is too new for Debian stable :/
>
> > Meaning it's not packaged or needs newer dependencies?
>
> IIRC it (well, public-inbox) is packaged but is an old version without
> the lei functionality, and/or there were some dependency issues.  It was
> a while ago that I looked.

v1.8.0 which is the latest, is in Debian and also in bullseye-backports.

-- 
Regards
Sudip

