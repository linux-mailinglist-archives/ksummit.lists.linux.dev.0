Return-Path: <ksummit+bounces-1543-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CABF942FE8
	for <lists@lfdr.de>; Wed, 31 Jul 2024 15:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15A2BB20B5F
	for <lists@lfdr.de>; Wed, 31 Jul 2024 13:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D90A1B29B8;
	Wed, 31 Jul 2024 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jUtWbJir"
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922331B150A
	for <ksummit@lists.linux.dev>; Wed, 31 Jul 2024 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431753; cv=none; b=UhAHG9/6glkLWF0DBwQr8YSf7RTb2/R4O2XXAw0TEDeNZPok+vsvNVHnk3vPwgUDUyDFe1fHD8zip1gkH6E87o6TIfZrFNO4JjqbkxjJKY+keU2Rc2VKt2Xz5hfMhtcl428iqbA3XyIYGTtmY0Z3knxjarKXBQ0YxWKhF3nh9cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431753; c=relaxed/simple;
	bh=0qkwQ0MmMQBMbBAsVU4qO+QelNoT7Eax5wkEMJX06Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUeOlWBGhMstOwfU8wmQM6NB9JCVmzpxrInP4aA2/rGBydS9vLZawzlMVR7xFW7zsGkUQF3Baj1CY5Okd5039KOBIMvEc815BRfeXvn2t7YTQi01n/c+m2yi6bWRjdY6zI4UBNEM/ZTNe3CSobBZZknZjMn6QyEbvKi7ydvuMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=jUtWbJir; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3db1d48083dso517410b6e.3
        for <ksummit@lists.linux.dev>; Wed, 31 Jul 2024 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722431750; x=1723036550; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ean7sSS19FfLz1vX4VUsoj/SGZS7nDauOxzT51mpNiw=;
        b=jUtWbJirSXuCSJ5psAMzcn/WiK9xiskseTwaF3C3aDdZG6V51PEsJ4XIgZfgEi1yRG
         ErFQlxVUJ0xvMg3KHKkKSwKzdqtxTtGemedcccGXgaLbILnLnh5m41SpdhDekw3uCUeq
         46XaYZRKZ22Z+Ie6olki9uAia2nxSS9/mzGxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431750; x=1723036550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ean7sSS19FfLz1vX4VUsoj/SGZS7nDauOxzT51mpNiw=;
        b=AaqnyqYvzZodGycyo/JsAZdJt2fp6akfN3Bn4J+hFQe0V7KjiNCI3GLESZhIznzHrc
         5DX1JXqvY1u/840rlEfUH8tbvsJriiRxQ96QgKxTEY/+REYDh5ICdqq20tcPmI8OFKk8
         Uy0hSrXrQPzIcbsWrkjXx5El2DhzeYnhXovDbgNB8P8IXjVy2qTm1V//GLI4q7nhH/nq
         5sb7FZNRO47Q+PBgs7Q6DicwPRChd1V7S+uczowfbMhSF8Ejz6It/8CoZuAeUfGvpp5e
         HCtu4qzgg1mG6PWwr4H7Ax5DxHEbmlkFfo6EoB1mh1oxWKF/qcuztTAJAxhYQSoDCZzZ
         92xg==
X-Forwarded-Encrypted: i=1; AJvYcCWTMXZbdjqZ0dgxOUGiMbzXC1fMs6h0Zu4NTW0M8y1XWnfdiuyJ2hgvtaFlr3Ull69+ginTic3IUzZX6DLAW2ZKNECqq2a0rg==
X-Gm-Message-State: AOJu0YwloxJAt4+k2P98X7/F6f/zfOv9tN1BmKYpMIYCqBL79PygfVVP
	sNA9MiPHCCfkU3tdImN6ezdyDVSaq6geAFEVajIEGLwjxQF4+g9vuzAvNZb/rSeAy6sU5LRr3Bz
	mhGbkRR37TaZ/i9dGP/90yzlqubb9z+sum0iKBQ==
X-Google-Smtp-Source: AGHT+IFRXAg1VLup8Q5b6YTsFY3klhFNVf83mG/k3C+eDgnwe1Nu09nxYmzuT2rekf8aCOwmOO+FFi5mCTeogw6pn3w=
X-Received: by 2002:a05:6871:9c01:b0:260:f1c4:2fdb with SMTP id
 586e51a60fabf-264c4479917mr11725728fac.8.1722431750651; Wed, 31 Jul 2024
 06:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240721192530.GD23783@pendragon.ideasonboard.com>
 <CAPybu_2tUmYtNiSExNGpsxcF=7EO+ZHR8eGammBsg8iFh3B3wg@mail.gmail.com>
 <20240722111834.GC13497@pendragon.ideasonboard.com> <CAPybu_1SiMmegv=4dys+1tzV6=PumKxfB5p12ST4zasCjwzS9g@mail.gmail.com>
 <20240725200142.GF14252@pendragon.ideasonboard.com> <CAPybu_1hZfAqp2uFttgYgRxm_tYzJJr-U3aoD1WKCWQsHThSLw@mail.gmail.com>
 <20240726105936.GC28621@pendragon.ideasonboard.com> <CAPybu_1y7K940ndLZmy+QdfkJ_D9=F9nTPpp=-j9HYpg4AuqqA@mail.gmail.com>
 <20240728171800.GJ30973@pendragon.ideasonboard.com> <CAPybu_3M9GYNrDiqH1pXEvgzz4Wz_a672MCkNGoiLy9+e67WQw@mail.gmail.com>
 <Zqol_N8qkMI--n-S@valkosipuli.retiisi.eu>
In-Reply-To: <Zqol_N8qkMI--n-S@valkosipuli.retiisi.eu>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 31 Jul 2024 15:15:39 +0200
Message-ID: <CAKMK7uGx=VjHCo90htuTE6Oi0b8rt_0NrPsfbZwFKA304m7BdA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2024 at 13:55, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> This is also very different from GPUs or accel devices that are built to be
> user-programmable. If I'd compare ISPs to different devices, then the
> closest match would probably be video codecs -- which also use V4L2.

Really just aside, but I figured I should correct this. DRM supports
plenty of video codecs. They're all tied to gpus, but the real reason
really is that the hw has decent command submission support so that
running the entire codec in userspace except the basic memory and
batch execution and synchronization handling in the kernel is a
feasible design. And actually good, because your kernel wont ever blow
up trying to parse complex media formats because it just doesn't.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

