Return-Path: <ksummit+bounces-744-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B058E3FE
	for <lists@lfdr.de>; Wed, 10 Aug 2022 02:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD191280A64
	for <lists@lfdr.de>; Wed, 10 Aug 2022 00:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E89518E;
	Wed, 10 Aug 2022 00:13:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8A160
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 00:13:20 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 12so12866863pga.1
        for <ksummit@lists.linux.dev>; Tue, 09 Aug 2022 17:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc;
        bh=LRpN8QSpLz8YUVLlmHj3jM4D14MWolRF+uNgInXqk5c=;
        b=R3ifHB9lzFyFW1tvvhnMkKg6y99+12dmyBbNxkrfsmy/BSCMUteLYCl2blwIreCNM3
         451gueF7l23pt+3Wd9UMG2g4W5hVrT9OAwvR6vhGG7anG/9T2+RL7I4DOjxCkKgnqNBG
         zTUftebgkseg0NizLd71rUEr9vzLKsvt0DmCe0BvAnVCcoiHVrX3j9xG+V10oxfDsmJ0
         uA0jv1mivou0WepF2hVbhFraPLiuftMneB4bF2H/X+4jdaphxeBcWodsNBqAwDrTYE+K
         qBFIkYSpjrdhpwySqoMmTKrGraa2WjG6240i6R8HeIw/OqEprpzTyuMgwqQI7tuWOZD/
         /6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc;
        bh=LRpN8QSpLz8YUVLlmHj3jM4D14MWolRF+uNgInXqk5c=;
        b=HNOhnj//z02VUbH923F84mfP9ToJZVD4md84Dzp5w+U2v4dqoDH7dxBrXTNr7Uf/vH
         BwE5DPUshdkO/I2Oan7/bABW0FUGfMDh4VVHMeRgZfIe6aLff6pWMXwSOO6BKsoQ4JTZ
         +QEQ1dDwchwLhKOa8gxGzT9+lD7k1SQsZfghfQgYy5hdawgO5+o0QG5xCnI3B0jmp8Gu
         dOBut5Q2q3ElKi6d9XuSLk4XBrFwZV1R1gGEgLrP86K3+ZyfAur+0Hxd5P5hS6Ex7t69
         p+YXvq2sSVQXNGn3El6u1pG0olGB4dYzx4VfGAAi8CqDbv1gnDHETLA1O6OXkeYQavCj
         wu3w==
X-Gm-Message-State: ACgBeo2o9CnGY8aOWabbYriSZLAUl8IqcmU1p3+/HEaCg4fHVLHHv45P
	ES4ls1XTcknihjbbXebVd+1Ys/Si/kOqCg==
X-Google-Smtp-Source: AA6agR7hCjytOGWJHU1y59IlNvbodVcZl4xJCdV509o6HslX94OFNvg0cnM33dq2lZiUzbo08CEGCQ==
X-Received: by 2002:a05:6a00:27a0:b0:52f:8947:4cc5 with SMTP id bd32-20020a056a0027a000b0052f89474cc5mr7892101pfb.16.1660090399545;
        Tue, 09 Aug 2022 17:13:19 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902d19100b0016d83ed0a2csm11299108plb.80.2022.08.09.17.13.18
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 17:13:19 -0700 (PDT)
Date: Tue, 9 Aug 2022 17:13:16 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: ksummit@lists.linux.dev
Subject: Validating MAINTAINERS entries?
Message-ID: <20220809171316.1d6ce319@hermes.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Several times in the past, when using MAINTAINERS list either automatically
(or from manual entry) have found the mailing address in the file is no longer valid.

What about doing an annual probe mail to all maintainers and sending
a patch to prune out any addresses that auto respond as dead.
This won't catch ghost entries but would find any dead ones.


