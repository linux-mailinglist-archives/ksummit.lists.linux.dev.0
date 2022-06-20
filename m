Return-Path: <ksummit+bounces-670-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73A5518F3
	for <lists@lfdr.de>; Mon, 20 Jun 2022 14:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 0A3622E0A4D
	for <lists@lfdr.de>; Mon, 20 Jun 2022 12:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D132E819;
	Mon, 20 Jun 2022 12:33:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557C7E5
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 12:33:00 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 89so15685048qvc.0
        for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=VDoUC2KUGTQ08iJ2uKNQ88SclD+qQ0ptUnIaICJBTgw=;
        b=N97HiIIc/xqTmonJ2FRCCAfa/fhF0aFM4tAubPasGyZX2lR3bLbfdaNaeOQLmyAll5
         qgBmIj3vOJuXaNpmxxT4IJEVPSeOi/cb64ocO/012p31qb9vmX+csMXgvX5F8mijx/Q3
         zSkGDZm38pIvCVYG54jpBDhAByLNCyinEDAxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=VDoUC2KUGTQ08iJ2uKNQ88SclD+qQ0ptUnIaICJBTgw=;
        b=6/8ufqYqKoupUzvX+0Vpq2VqBSYwzeyb2k6xFpE2zlpjkr38BH4aNKXyAuRjc/OjCg
         deG4idhQOSDApc0rHaL1jozbyxchih1e1em7E27TBe/lfwsofDEbgrMFPjUNa7/o/Ntn
         tWma2ucT7MW52hG5fQg8HN256S4lAXraWZdKIiKO8jwkm1sW3Pe8a0P/TIYb+MGZObsX
         WHWTUu5h8+XGo7wGY5t0jUy/fRPp3kuD5Q6NzPoqX6pBZZ/rXzrvDlGgT8WMIY7mFzik
         BZO9n3KDjko62Kirj1i08hNUyeRIbz8BfChaTXUWJL6TjoIkIEC6wh0I82fX8MgXGsZz
         bbNA==
X-Gm-Message-State: AJIora+vejVNJoVCLTvHBG9B0tbwk/a2ElWpqS3zA6Jl0wkvPNGGEZJz
	5mZXBi1a4p2T/c1KdwPtYH6quUf46jvXwg==
X-Google-Smtp-Source: AGRyM1t4Cpx/477d56s/KQBP9rTa8iEWITRhYRPRPrUEQaC90X7VMqL45G+252+p4EAQcHg1QvyKFQ==
X-Received: by 2002:ad4:5ccf:0:b0:470:4594:fcab with SMTP id iu15-20020ad45ccf000000b004704594fcabmr3163761qvb.33.1655728378972;
        Mon, 20 Jun 2022 05:32:58 -0700 (PDT)
Received: from meerkat.local ([209.226.106.245])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a0d8900b006a6af149cffsm12684440qkl.61.2022.06.20.05.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 05:32:58 -0700 (PDT)
Date: Mon, 20 Jun 2022 08:32:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: ksummit-discuss@lists.linux-foundation.org
Cc: ksummit@lists.linux.dev
Subject: The old ksummit-discuss list is now DEFUNCT
Message-ID: <20220620123253.hrponedanltupuzb@meerkat.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dgl3khmutsni2sm2"
Content-Disposition: inline


--dgl3khmutsni2sm2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

I know that the official 2022 Kernel Summit instructions said to send mail to
ksummit-discuss@lists.linux-foundation.org. This was almost certainly a
copy-pasting error, as the list was migrated to ksummit@lists.linux.dev last
year.

So, I'm taking proactive measures to remove this confusion:

- the ksummit-discuss list is put on emergency moderation and will accept no
  new messages
- there will be an auto-bounce to any received mail that the list has moved

I cannot make the old address "just work" for the new destination, as
lists.linux-foundation.org is a legacy semi-defunct mailman server whose
management is outsourced to OSUOSL. I will backfill any discussions to the
archive on lore.kernel.org/ksummit, but anyone participating in threads sent
to the old list will need to manually edit the CC on replies to send things to
the non-defunct address (or get a bounce back).

Unfortunately, that's the only way to make it work with least amount of
transition time.

-K

--dgl3khmutsni2sm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYrBo6wAKCRC2xBzjVmSZ
bFyhAPsG7zDvGAAoqB8KDHvVNx9PEqUV1bl9AHVL429fGm8rLAD+Owxq65aIWtfx
D4w1E1Ljf4i6bHUkUEHyPeNrdJh8oQ8=
=vPzA
-----END PGP SIGNATURE-----

--dgl3khmutsni2sm2--

