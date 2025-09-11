Return-Path: <ksummit+bounces-2332-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C416B52F09
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E09FC4E1C34
	for <lists@lfdr.de>; Thu, 11 Sep 2025 10:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E520F3101C8;
	Thu, 11 Sep 2025 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WgY2R1xb"
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094D38F7D
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588388; cv=none; b=PiUtUjgG3rmDbIqAk6paP+XbEP4skKuwN23lAtFXmbijEJmfj9aiOj08pQpZzo/WBCgKJb9wzIkqBEkponlpH5demuJoA7YkUwnhczUxcqMLfg/uOPQKCY0yCVXoDJc000n+00XCgz1Pg2Q5ZSg4fl2sZ3BnNI79Y5UHMiRzRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588388; c=relaxed/simple;
	bh=1PvF0deenEGFNJGwYvdqI6qcQNlqBuWOo7e9ShmKcWI=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jeXExaptcdTA7oKJ3ynxMRFNuXTYdLynXveEbwQXJiY1FJovqdLYPfONIe0AKXJpttN3Oa0Gi2PaVWGa5C++MHUUh9MZq3fvCcIcndLcfpwzMABirUuyJI+Ub3Q1xVprMjqrhx9spCA6szk/+B/RqRq+oqIpf2ffXHeW/LUW+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WgY2R1xb; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B9qZ0h023376;
	Thu, 11 Sep 2025 10:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1PvF0d
	eenEGFNJGwYvdqI6qcQNlqBuWOo7e9ShmKcWI=; b=WgY2R1xb4krzv2y2XQO4Pa
	CGQm3MGyftoxaUJQq9S0uG8GMVg4Y4wOZ52+3BEqqhmSrlgO01m4lBPYmQWH6IHD
	Pf96yzkcqhXKljQTf93+zmBLPYYIQf1G0YSW+nX6DN68A6RjIaUfKJDyumlNDN+l
	2XukPmCColu7zeYqdfh76OLGmbJHp8/q9dktzV6E4mKDrlfC63fhYVxWBLn7MiRr
	KTpD/LI47C0lvQCKoyNZpQGps7KneFiJOhFo/XxqRmt7Zmk/uVfNA8RbutwZVOy8
	o/cik0xZNM40oNSS+T8uUZbsUIb6It1Q3mgMJsLor1/S2KUaTUVpnp8pS5XKQXJg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx44sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 10:59:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8sioA020492;
	Thu, 11 Sep 2025 10:59:38 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp15j9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 10:59:38 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58BAxcjt32703078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Sep 2025 10:59:38 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21D615805D;
	Thu, 11 Sep 2025 10:59:38 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9AAF58054;
	Thu, 11 Sep 2025 10:59:37 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.29.192])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Sep 2025 10:59:37 +0000 (GMT)
Message-ID: <1dcb569edd7f73f2df4019bf459fdcb35dcdf921.camel@linux.ibm.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
From: Mimi Zohar <zohar@linux.ibm.com>
To: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>,
        ksummit@lists.linux.dev
In-Reply-To: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
References: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Sep 2025 06:59:37 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XER92urdckE2bgsxO83lfZKWTE1di6sK
X-Proofpoint-ORIG-GUID: XER92urdckE2bgsxO83lfZKWTE1di6sK
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c2aba1 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=tf-vCfap5zr9poDNSDAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX6sFN++TlDxtl
 IUtTPogzBCWBr/gcty6LLWKk5Mq0L81iRG1FjvTfYr0Nd9jdyE+5Cw5e0XGPAjj+Tx+QGxvPjF/
 Ch9ioOO3jlMspKfk9Go07TkfpqLD60Q1yVyQkSuK4YlyQN9vjPmY/E/2c3NUHraINvL6AuPSCH7
 vkwgl4gH/3ZeAfogYGs7FCgYH+iFZWKTIPmPWXF+MO95ukkaIDBmF2RHvMSHHTG3WpVO/Yz773T
 Sg75uLAi+dXHxFFq3ahQ+gJzTKFRcgJNR4rmByB+aC9bqM3av56IThAMpuMKawBejFYn0V/gY4d
 1rxVlYODRAzBiLJvHsXZBGKazcItiq80qmrx7oiXzURsQGZEuuYlK1UKXqq4agK7DQFNxs5SXJf
 cOYc8GhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025

On Wed, 2025-09-10 at 22:37 +0300, Sinyuk, Konstantin wrote:
> Hi All,
>=20
> The UALink Consortium is defining an open, vendor=E2=80=91neutral interco=
nnect aimed
> at scaling AI workloads with low=E2=80=91latency, memory=E2=80=91semantic=
 communication
> beyond PCIe. Unlike proprietary solutions such as NVLink (NVIDIA) or
> Infinity Fabric (AMD), UALink is a cross=E2=80=91vendor standard and was =
recently
> recognized at FMS 2025.
>=20
> I would like to present a proposal on what UALink support could look like=
 in
> the upstream Linux kernel.
>=20
> Key areas for discussion:
> - Core driver design: proposed start under drivers/misc/ual/ for discover=
y,
> =C2=A0 topology, and resource management.
> - Memory semantics: same=E2=80=91OS and multi=E2=80=91OS rack scenarios, =
leveraging dma_buf,
> =C2=A0 HMM, and NUMA.
> - Control path: AUX bus for vendor extensions, offloading real=E2=80=91ti=
me sequences
> =C2=A0 to device microcontrollers, generic UALink interface.
> - Security: confidential compute support and a userspace daemon for topol=
ogy
> =C2=A0 and authentication.
> - Upstreaming strategy: begin with a minimal core driver, then incrementa=
lly
> =C2=A0 extend toward MM integration, dma_buf support, security, and
> =C2=A0 cross=E2=80=91subsystem work.
>=20
> The goal is to decide how UALink should be represented as a first=E2=80=
=91class
> interconnect in Linux, complementing CXL while remaining vendor=E2=80=91n=
eutral,
> ABI=E2=80=91stable, and maintainable.

Hi Konstantin,

It would be nice to have all the Linux Security Module (LSM) hooks in all t=
he
right places from the beginning for integrity (e.g. signature verification)=
.

thanks,

Mimi

