Return-Path: <ksummit+bounces-1132-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC41079E2DD
	for <lists@lfdr.de>; Wed, 13 Sep 2023 11:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6FF5281DA7
	for <lists@lfdr.de>; Wed, 13 Sep 2023 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DA61DDC1;
	Wed, 13 Sep 2023 09:02:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3C5666
	for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 09:02:27 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so6582090f8f.0
        for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694595746; x=1695200546; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HRTRbFZJh4XAHTJN5eKSoroBdAC5FLFzn4V3+j6nORQ=;
        b=hIzFD1v9BaxnyU7Pkx2qllTNdq4CaYH5B4aFknNo+xDSJOv3pWm7+wQIdf6ttYKpts
         cAU8jzfd8RBaTc51ALSRGtHdQ2S0a70HqWq9SnBDAKhMunmM358Zr9k4OMOmhMDB57ZA
         9dpkMe2HbDYHZkc+NskhFG+AfSC3rDtFHDNB6hKVZai23IGozSGJRUjNhcyxi+ppWs0P
         VlCshkWjuz7cOQnBEBCd/cfpn+cW0olpB3yaU7wgwfvHNmsICFgLPYBCv6FXTS0JfOYB
         ooBsJV9jNOtyORdtw/YXDd0avSuBH0gxVOQh3Oa3+TsLVbWCFrSdTtWlxEuglF23HPjd
         c+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694595746; x=1695200546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRTRbFZJh4XAHTJN5eKSoroBdAC5FLFzn4V3+j6nORQ=;
        b=TdnDigHnDL5AXt100Y2nQCnq5nEHQTGL8/AdR57Sc5/tWA5zC5OJBlO1WYct+nVpTS
         xvCT67SpkbTgCGqmrV7ooesvRN+aIDzVO46nYUhBjssQv3KraZdtzKSuKUWQPzEQo/NI
         WiPshiLFzQy+OLKJ7nxCzF4FxKklfRFpgINAp/o/Gfd0IFHewYp/5IKoAqLVRXnWxwrB
         VXknGTumjlYiF/PFKnBEJ8q5sPmz0Ig3E8ppOH5ZpEz/MXvffZRA4ovmHjJcJocyHalj
         f4ntE5GrY1CIVdwgzcdJrDTBkqMwekJKusclbZKUkFa0lPNWJtDXxPLYzlaqHpAEFMh7
         fM2w==
X-Gm-Message-State: AOJu0YwjkhwnWrQ0JxkwjpML8zIS7Wiyq3S88emOpUDG4k7u5LuRE2ip
	XSSH/HpkuRwDTSSfVCe3SaCOvg==
X-Google-Smtp-Source: AGHT+IFtKhSHWAnEX+piYghO9XlOidzxVfIYKcnu8olERPEDv1+vHwHsTT34vuP49a5a1C/TZUxgpw==
X-Received: by 2002:a5d:44cf:0:b0:31f:651f:f84f with SMTP id z15-20020a5d44cf000000b0031f651ff84fmr1531841wrr.27.1694595746260;
        Wed, 13 Sep 2023 02:02:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r18-20020a5d6952000000b003141a3c4353sm15090784wrw.30.2023.09.13.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:02:26 -0700 (PDT)
Date: Wed, 13 Sep 2023 12:02:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <c8df7f79-76ba-4f7e-a369-b85f9be68ed6@kadam.mountain>
References: <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>

On Mon, Aug 21, 2023 at 09:23:18PM +0200, Vegard Nossum wrote:
> Let's say you're completely sure you found an issue with the patch. Why
> not just stay silent, hope that nobody catches it, and then submit your
> own patch later to fix it? That will get your name in the log. Even
> worse, if it's a security issue you can maybe write an exploit for it
> and either get a bounty from Google or sell it for serious $$$ to
> various malicious actors. [Note that I'm not saying most people would do
> this; I don't know. I am just using it as an example to show that the
> incentives are disproportionate.]

Every year, I say that there should be a tag for people who find bugs
during reviews (no credit for style complaints) "Bug-fix-from:".  I
think it would be a lot of fun to collect these tags.  The whole tagging
system is already gamified so we might as well use it to encourage good
behavior.

regards,
dan carpenter


