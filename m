Return-Path: <ksummit+bounces-747-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7C58E903
	for <lists@lfdr.de>; Wed, 10 Aug 2022 10:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1180E280A8D
	for <lists@lfdr.de>; Wed, 10 Aug 2022 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF36B17D4;
	Wed, 10 Aug 2022 08:46:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691117CE
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 08:46:51 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id k12so22213561ybk.6
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zq0Qsb90HUFM/GBOOvVH3GvSZz7eZrCdLogyIrJLYXg=;
        b=ql8ZRsXRiYJylLPUtgU9svCppCunX2dxTm6rNlv+Mw0ZtpNo4WajXCjPsKdZDksri0
         D5XD1bwWz6ytYdxdVpo7bQjd64lFvAM/Ir6vKxAZEU37ADiieSzZ1Sdm7K3Ta7qY4zXe
         IEDO3xrqSdBXfTUJQcMe+bNdBNrwYE44+GWPs33KmP9GjFAbfy3QwtxDn+DZEKP+sp1M
         PdMpdmMLfEOYT0Tc2bwm5JVbaTbGkyT5JS4zNfZXGaN5YrLS55GzpyG+WFRmRtESkPli
         oFPfc7Sgtio0D9RFdyAxt5uDXmCnt3osqEDpeH1hsWfL8XahPqqimKZtB6YN5qt598ME
         i0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zq0Qsb90HUFM/GBOOvVH3GvSZz7eZrCdLogyIrJLYXg=;
        b=nGChiMIZSrp4sbLUeEbNNGxFHaaUy+8sX1PEyeTnbw/TQtE6rutackfkAKWqnjJ6QH
         beK/1L3ElNoRnOcoRPcrNcsdc/CIatttjdMnQnPZ1QAiwofPaqVqz8aGFWE6HUE/fE5t
         +2xG2DVghEbqA3UKEH5RAtnvzlELWjZj+S2AlijMjCgG9xr660A/sze9/83Xh3B1UiSa
         2cpJfOz+0DQARcXhJKJqB2UJi1/RK/568nM4kZaBztbVyuaQJp/MUYsr7BhvagZlnSSy
         Tjo1RDr8DeIIlWYdUDFxXpI/VN/zRIDMqVUt8oB2NANet7pw1H5C+yi1YTnb13P6qHH+
         50ZQ==
X-Gm-Message-State: ACgBeo1AOweaZyGGVW/sxLXAPOCes0iZ2/e1crztLRPEhdwf79damsEr
	JEDvGw+2PTjFOOTzaXHD1JLX+u1o7uibm979fEQBgA/yjCE=
X-Google-Smtp-Source: AA6agR560H2aMcIEQ8i9l+0rUT/S0VgRNU8XVkjWf5qZQn97mmRDcg/39ARkqpQhoOKpPqW7rZfZTeqjbZTuk0SX1RA=
X-Received: by 2002:a25:f503:0:b0:677:8006:4dc2 with SMTP id
 a3-20020a25f503000000b0067780064dc2mr24346020ybe.31.1660121209995; Wed, 10
 Aug 2022 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809171316.1d6ce319@hermes.local> <20220810082640.GK3438@kadam>
In-Reply-To: <20220810082640.GK3438@kadam>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 10 Aug 2022 10:46:39 +0200
Message-ID: <CAKXUXMwMAyc5GW-t2Xp6XPkt=AcsPZNS89RGn6oo_YH-y6HcDg@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 10:27 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> > Several times in the past, when using MAINTAINERS list either automatically
> > (or from manual entry) have found the mailing address in the file is no longer valid.
> >
> > What about doing an annual probe mail to all maintainers and sending
> > a patch to prune out any addresses that auto respond as dead.
> > This won't catch ghost entries but would find any dead ones.
> >
>
> Also we could add a RETIRED file or something for when people retire and
> don't want get_maintainer.pl hassling them.
>

Dan, I believe this exists already: .get_maintainer.ignore

For many years, there was only one developer using this feature, now
we have at least two developers. It seems that many others resolve
this issue just in their local setup differently, though.

Lukas

